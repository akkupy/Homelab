#!/bin/bash


function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}


echo "Creating directories..."
sudo mkdir -p /home/$USER/vaultwarden || error "Failed to create vaultwarden folder!"
echo "Done !"
echo "Downloading vaultwarden container."
docker pull vaultwarden/server:latest
echo "Initialising Vaultwarden"
docker run -d --name vaultwarden -v /home/$USER/vaultwarden:/data/ -p 4001:80 vaultwarden/server:latest
echo " Done!"