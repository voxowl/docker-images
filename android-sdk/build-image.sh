#!/bin/bash

# exit if any command fails
set -e

# ------------------------------
# Parse flags
# ------------------------------

POSITIONAL_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    -n|--name)
      IMAGE_NAME="$2"
      shift # past argument
      shift # past value
      ;;
    # -s|--searchpath)
    #   SEARCHPATH="$2"
    #   shift # past argument
    #   shift # past value
    #   ;;
    # --default)
    #   DEFAULT=YES
    #   shift # past argument
    #   ;;
    -*|--*)
      echo "Unknown option $1"
      exit 1
      ;;
    *)
      POSITIONAL_ARGS+=("$1") # save positional arg
      shift # past argument
      ;;
  esac
done

set -- "${POSITIONAL_ARGS[@]}" # restore positional parameters

# ------------------------------
# Default values
# ------------------------------

DEFAULT_IMAGE_NAME="voxowl/android-sdk"
IMAGE_NAME="${IMAGE_NAME:-$DEFAULT_IMAGE_NAME}"

# ------------------------------
# Build image
# ------------------------------

echo "⚙️  Building image: ${IMAGE_NAME}"
docker build -t ${IMAGE_NAME} -f ./Dockerfile .
