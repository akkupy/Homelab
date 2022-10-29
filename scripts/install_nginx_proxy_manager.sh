#!/bin/bash

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

echo "Creating directories..."
sudo mkdir -p /home/$USER/nginx-proxy-manager/data || error "Failed to create data folder!"
sudo mkdir -p /home/$USER/nginx-proxy-manager/letsencrypt || error "Failed to create letsencrypt folder!"
echo "Creating a blank nginx-proxy-manager config files"
sudo touch /home/$USER/nginx-proxy-manager/config.json || error "Failed to touch config.json file!"
echo "Creating a blank docker compose file"
sudo touch /home/$USER/nginx-proxy-manager/docker-compose.yml || error "Failed to touch docker-compose.yml file!"
echo "Pre-installaton complete."
