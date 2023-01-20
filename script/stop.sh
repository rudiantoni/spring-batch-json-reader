#!/bin/sh
ENV_FILE=environment.env
CUR_DIR=$(pwd)
cd docker
echo
echo "Stopping using the environment file: $ENV_FILE"
sudo docker-compose --env-file ../$ENV_FILE down
cd $CUR_DIR