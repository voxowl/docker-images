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
      NAME="$2"
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
# Build image
# ------------------------------

echo "⚙️  Building image: ${NAME}"
docker build -t ${NAME} -f ./Dockerfile .
