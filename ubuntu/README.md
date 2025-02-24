# Voxowl Ubuntu image

It's a ubuntu image with additional packages installed:

- `ca-certificates`: needed to send requests using HTTPS

## Build the image locally

```shell
# From the current directory
docker build -t voxowl/ubuntu:24.04 -f ./Dockerfile .
```

## Build and publish the image for multiple architectures

*Note: you must be logged-in as `voxowl` on the Docker Hub registry*

```shell
# From the current directory
docker buildx build --platform linux/amd64,linux/arm64 -f ./Dockerfile --push -t voxowl/ubuntu:24.04 .
docker buildx build --platform linux/amd64,linux/arm64 -f ./Dockerfile --push -t voxowl/ubuntu:latest .
```
