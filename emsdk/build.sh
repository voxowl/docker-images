#!/bin/bash

set -e

# Retrieve script argument 1
EMSDK_VERSION=$1
if [ -z "$EMSDK_VERSION" ]
then
      echo "emsdk version argument is missing. abort."
      exit 1
fi
echo "Building for emsdk version $EMSDK_VERSION"

# Test if version is supported
# TODO: !

# DEV
# ----------
docker build \
--platform linux/amd64 \
--build-arg EMSDK_VERSION=$EMSDK_VERSION \
-t voxowl/emsdk:$EMSDK_VERSION \
-f ./Dockerfile \
.

# NOTES : for later (PROD with amd64 + arm64)
# ----------
# docker buildx build --platform linux/amd64,linux/arm64 -t voxowl/emsdk:3.1.39 -f ./Dockerfile .
