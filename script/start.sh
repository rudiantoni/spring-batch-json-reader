#!/bin/sh
ENV_FILE=environment.env
CUR_DIR=$(pwd)
cd docker
echo
echo "Starting using the environment file $ENV_FILE..."
sudo docker-compose --env-file ../$ENV_FILE up -d
cd $CUR_DIR