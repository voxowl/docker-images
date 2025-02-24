# emsdk image

This is a Docker image useful for compiling wasm/emscripten projects.
It's an Ubuntu LTS, with needed tools for emscripten.

It's published as `voxowl/emsdk` on the Docker Hub.

## Build the image locally

```shell
# From the current directory
./build.sh 4.0.3
# docker build -t voxowl/emsdk:4.0.3 -f ./Dockerfile --build-arg EMSDK_VERSION=4.0.3 .
```

## Build and publish the image for multiple architectures

*Note: you must be logged-in as `voxowl` on the Docker Hub registry*

```shell
# From the current directory
./publish.sh 4.0.3
# docker buildx build --platform linux/amd64,linux/arm64 -t voxowl/emsdk:4.0.3 -f ./Dockerfile --build-arg EMSDK_VERSION=4.0.3 --push .
```
