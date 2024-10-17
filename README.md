# Snyk Connectivity Checker

A Docker-based tool for checking the connectivity of a Snyk Broker and SCM services.
This tool allows users to verify whether the specified URLs are reachable on the given ports,
To be run from within their container infrastructure

## Features
- Check connectivity to Snyk Broker and SCM services.
- Automatically extracts ports from the provided URLs.
- Flexible: Test any HTTP/HTTPS URL on any specified port.

1. Clone the Repository:
   Clone this repository to your local machine using the following command:
     git clone https://github.com/yourusername/snyk-connectivity-checker.git
     cd snyk-connectivity-checker
2. Build the Docker Image: Once you're in the project directory, build the Docker image using the following command:
     docker build -t snyk-connectivity-checker .

Usage
After building the image, you can run the container while passing the necessary arguments for the Snyk broker and SCM URLs.

Running the Connectivity Checker
To run the connectivity checker, use the following command format:
  docker run --rm snyk-connectivity-checker <SNYK_BROKER_URL> <SCM_URL>

Example
docker run --rm snyk-connectivity-checker https://broker.snyk.io https://MyOnPremSCM.com:8080

Checking connectivity to Snyk Broker: https://broker.snyk.io on port 443
Snyk Broker is reachable at https://broker.snyk.io on port 443.
Checking connectivity to SCM: https://MyOnPremSCM.com:8080 on port 8080
SCM is NOT reachable at https://MyOnPremSCM.com:8080 on port 8080.
