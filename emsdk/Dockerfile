FROM ubuntu:24.04

RUN apt update && apt install -y \
	cmake \
	python3 \
	g++ \
	unzip \
	xz-utils \
	lbzip2

ARG EMSDK_VERSION
ENV EMSDK_NAME=emsdk-${EMSDK_VERSION}

# install emsdk
WORKDIR /
COPY ./$EMSDK_VERSION/emsdk.zip ./emsdk.zip
# extract `emsdk.zip` into `emsdk` directory
RUN unzip -o ./emsdk.zip
RUN mv $EMSDK_NAME ./emsdk
# remove zip
RUN rm ./emsdk.zip

WORKDIR /emsdk
RUN ./emsdk install $EMSDK_VERSION
RUN ./emsdk activate $EMSDK_VERSION
