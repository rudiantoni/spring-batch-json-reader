#!/bin/sh
ENV_FILE=environment.env
. ./$ENV_FILE
echo "Building application container image..."
sudo docker build --rm -f $APPLICATION_DOCKERFILE_FILE_PATH -t $APPLICATION_IMAGE_NAME .