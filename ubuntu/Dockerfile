FROM ubuntu:24.04

# ca-certificates package contains the CA certificates for the system.
# It is needed to send requests using HTTPS.

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    