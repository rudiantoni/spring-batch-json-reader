#!/bin/sh
ENV_FILE=environment.env
. ./$ENV_FILE
echo
echo "Watching logs for $APPLICATION_CONTAINER_NAME application container..."
sudo docker logs -f --tail 500 $APPLICATION_CONTAINER_NAME

