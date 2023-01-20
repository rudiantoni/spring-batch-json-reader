#!/bin/sh
echo
echo "Cleaning all untagged and dangling docker images"
sudo docker images -q -f "dangling=true" | sudo xargs --no-run-if-empty docker rmi -f