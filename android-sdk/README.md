# android-build-env

Docker image containing the Android build tools.

## Build the docker image

You can use the `build-image.sh` script:

```shell
./build-image.sh --name voxowl/android-sdk:
```

Or you can build the image manually:

```shell
IMAGE_NAME=voxowl/android-sdk 
docker build -t ${IMAGE_NAME} -f ./Dockerfile .
```

```shell
docker build -t voxowl/android-sdk -f ./Dockerfile .
```