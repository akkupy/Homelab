#!/bin/bash


function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}


echo "Creating directories..."
sudo mkdir -p /home/$USER/Z-Vote || error "Failed to create Z-Vote folder!"
sudo mkdir -p /home/$USER/Z-Vote/nginx || error "Failed to create Z-Vote/nginx folder!"
echo "Done !"