#!/bin/sh

# Usage: ./check_connectivity.sh <SNYK_BROKER_URL> <SCM_URL>

SNYK_BROKER_URL=$1
SCM_URL=$2

# Function to check connectivity
check_connectivity() {
    URL=$1
    SERVICE_NAME=$2

    # Extract the port from the URL
    # If no port is specified, set the default ports based on the protocol
    if echo "$URL" | grep -q "http://"; then
        PORT=$(echo "$URL" | awk -F: '{print ($3 == "" ? 80 : $3)}' | awk -F/ '{print $1}')
    elif echo "$URL" | grep -q "https://"; then
        PORT=$(echo "$URL" | awk -F: '{print ($3 == "" ? 443 : $3)}' | awk -F/ '{print $1}')
    else
        echo "Unsupported URL format: $URL"
        exit 1
    fi

    echo "Checking connectivity to $SERVICE_NAME: $URL on port $PORT"

    # Use curl to check if the URL is reachable
    if curl --output /dev/null --silent --head --fail "$URL"; then
        echo "$SERVICE_NAME is reachable at $URL on port $PORT."
    else
        echo "$SERVICE_NAME is NOT reachable at $URL on port $PORT."
    fi
}

# Check connectivity to Snyk Broker
check_connectivity "$SNYK_BROKER_URL" "Snyk Broker"

# Check connectivity to SCM
check_connectivity "$SCM_URL" "SCM"
