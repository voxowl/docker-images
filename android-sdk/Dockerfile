
# --------------------------------------------------
#  Base environment with Java SDK
# --------------------------------------------------
FROM --platform=linux/amd64 ubuntu:22.04 AS base-env
RUN apt update && apt install -y openjdk-17-jdk-headless

# --------------------------------------------------
# Download Android tools
# --------------------------------------------------
FROM --platform=linux/amd64 base-env AS installer
RUN apt install -y wget unzip
RUN mkdir /android && mkdir /downloads

# Download Android commande line tools
ENV ANDROID_HOME="/android"
ENV PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"
RUN wget -c https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip -P /downloads
RUN unzip /downloads/commandlinetools-linux-9477386_latest.zip -d /android/cmdline-tools
RUN rm /downloads/commandlinetools-linux-9477386_latest.zip
# NOTE : the sdkmanager expects to reside in an environment called. /YOURPATH/cmdline-tools/SOMETHING/bin but unpacks to /YOURPATH/cmdline-tools/bin
RUN mv $ANDROID_HOME/cmdline-tools/cmdline-tools $ANDROID_HOME/cmdline-tools/latest
# /android/cmdline-tools/latest/bin

# Accept all Android SDK licences
RUN yes | sdkmanager --licenses

# --------------------------------------------------
# Android command line tools
# --------------------------------------------------
FROM --platform=amd64 base-env AS android-cmdline-tools
COPY --from=installer /android /android
ENV ANDROID_HOME="/android"
ENV PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"

# --------------------------------------------------
# Android SDK 33 / NDK 25.2
# --------------------------------------------------
FROM --platform=amd64 android-cmdline-tools AS android-sdk-ndk
ENV ANDROID_HOME="/android"
ENV PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"
RUN sdkmanager --list
RUN sdkmanager --install "cmake;3.22.1"
RUN sdkmanager --install "platform-tools"
RUN sdkmanager --install "build-tools;33.0.2"
RUN sdkmanager --install "platforms;android-33"
RUN sdkmanager --install "ndk;25.2.9519653"

# --------------------------------------------------
# Android SDK 33 / NDK 25.2 + build tools (make, python3, perl)
# --------------------------------------------------
FROM --platform=amd64 android-sdk-ndk AS android-sdk-ndk-buildtools
RUN apt install -y make python3 perl
