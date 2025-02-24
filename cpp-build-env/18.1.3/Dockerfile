#
# cpp-build-env/18.1.3/Dockerfile
#
# voxowl/docker-images project
#
# ubuntu 24.04
# clang 18.1.3
# cmake 3.28.3
# ninja 1.11.1
#

FROM ubuntu:24.04

RUN apt update && \
    apt upgrade -y && \
    apt install -y clang cmake ninja-build jq && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
