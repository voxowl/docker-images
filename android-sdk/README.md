# android-build-env

Docker image containing the Android build tools.

## Build the docker image

You can use the `build-image.sh` script:

```shell
./build-image.sh --name voxowl/android-sdk:latest
```

Or you can build the image manually:

```shell
IMAGE_NAME=voxowl/android-sdk:latest
docker build -t ${IMAGE_NAME} -f ./Dockerfile .
```

```shell
docker build -t voxowl/android-sdk:latest -f ./Dockerfile .
```

## Publish the docker image

To publish on the Docker Hub you must be logged-in. (as user `voxowl` here)
```shell
docker logout
docker login --username voxowl --password dummy123
```

```shell
docker push voxowl/android-sdk:latest
```
