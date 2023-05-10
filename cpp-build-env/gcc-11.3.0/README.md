# C++ build environment image

This is a Docker image useful for compiling C/C++ code.
It's an Ubuntu LTS, with `libreadline-dev` & `build-essential` packages.

## Build the image locally

```shell
# From the current directory
docker build -t voxowl/cpp-build-env:gcc-11.3.0 -f ./Dockerfile .
```

## Build and publish the image for multiple architectures

*Note: you must be logged-in as `voxowl` on the Docker Hub registry*

```shell
# From the current directory
docker buildx build --platform linux/amd64,linux/arm64 -t voxowl/cpp-build-env:gcc-11.3.0 -f ./Dockerfile --push .
```
