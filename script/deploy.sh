#!/bin/sh

# Build application container image
sh script/build_docker_image.sh

# # Stop/remove previous execution services (if any)
sh script/stop.sh

# # Start services
sh script/start.sh

# # Clean all untagged and dangling docker images
sh script/clean_images.sh

# # Watch logs for application container...
sh script/logs_app.sh

echo
echo "Finished successfully."