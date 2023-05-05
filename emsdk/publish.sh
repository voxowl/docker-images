#!/bin/bash

set -e

docker buildx build --platform linux/amd64,linux/arm64 -t voxowl/emsdk:2.0.34 -f ./Dockerfile --push .
