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

# Download emsdk if not already present
# -----------------------------------------------
if [ ! -d "$EMSDK_VERSION" ]
then
    echo "Downloading emsdk version $EMSDK_VERSION"
    mkdir -p $EMSDK_VERSION
    if ! curl -L -f -o $EMSDK_VERSION/emsdk.zip https://github.com/emscripten-core/emsdk/archive/refs/tags/$EMSDK_VERSION.zip; then
        echo "Error: Failed to download emsdk"
        rmdir $EMSDK_VERSION
        exit 1
    fi
    if [ ! -s "$EMSDK_VERSION/emsdk.zip" ]; then
        echo "Error: Downloaded file is empty"
        rm $EMSDK_VERSION/emsdk.zip
        rmdir $EMSDK_VERSION
        exit 1
    fi
fi

# Build and publish docker image
# -----------------------------------------------
docker buildx build \
--platform linux/amd64 \
--platform linux/arm64 \
--build-arg EMSDK_VERSION=$EMSDK_VERSION \
-t voxowl/emsdk:$EMSDK_VERSION \
-f ./Dockerfile \
--push \
.
