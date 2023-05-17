#!/bin/bash


function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}


echo "Creating directories..."
sudo mkdir -p /home/$USER/zvote || error "Failed to create zvote folder!"
echo "Done !"