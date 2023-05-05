# Wasm build environment image 

This is a Docker image useful for compiling wasm/emscripten projects.
It's an Ubuntu LTS, with needed tools for emscripten.

It's published as `voxowl/wasm-build-env` on the Docker Hub.

## Build the image locally

```shell
# From the current directory
docker build -t voxowl/wasm-build-env:2.0.34 -f ./Dockerfile .
```

## Build and publish the image for multiple architectures

*Note: you must be logged-in as `voxowl` on the Docker Hub registry*

```shell
# From the current directory
docker buildx build --platform linux/amd64,linux/arm64 -t voxowl/wasm-build-env:2.0.34 -f ./Dockerfile --push .
```