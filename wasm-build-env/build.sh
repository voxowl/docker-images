#!/bin/bash

set -e

docker buildx build --platform linux/amd64,linux/arm64 -t voxowl/wasm-build-env:2.0.34 -f ./Dockerfile .
