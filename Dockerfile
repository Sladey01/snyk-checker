# Use an official lightweight base image
FROM alpine:latest

# Install curl for connectivity checks
RUN apk add --no-cache curl

# Copy the connectivity check script into the container
COPY check_connectivity.sh /usr/local/bin/check_connectivity.sh

# Make the script executable
RUN chmod +x /usr/local/bin/check_connectivity.sh

# Set the entrypoint to run the connectivity check script
ENTRYPOINT ["/usr/local/bin/check_connectivity.sh"]
