# Bazel for C/C++

this is heavily inspired by https://github.com/bazelbuild/continuous-integration/tree/master/bazel/oci

## Build the image locally

`./build.sh voxowl/bazel <version>`

```sh
# From the /bazel directory
./build.sh voxowl/bazel 7.5.0
./build.sh voxowl/bazel 8.1.1
```

## Build and push the image to hub.docker.com

`./build.sh voxowl/bazel <version>`

```sh
# From the /bazel directory
./build_push.sh voxowl/bazel 7.5.0
./build_push.sh voxowl/bazel 8.1.1
```

## Run the image

```sh
# override user (root) & entrypoint (bash)
docker run -ti --rm -u 0 --entrypoint bash voxowl/bazel:7.5.0
```
