#!/bin/bash

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

function check_internet() {
  printf "Checking if you are online..."
  wget -q --spider http://github.com
  if [ $? -eq 0 ]; then
    echo "Online. Continuing."
  else
    error "Offline. Go connect to the internet then run the script again."
  fi
}

function show_ascii_akkupy() {
    echo -e "

           _    _                      
     /\   | |  | |                     
    /  \  | | _| | ___   _ _ __  _   _ 
   / /\ \ | |/ / |/ / | | | '_ \| | | |
  / ____ \|   <|   <| |_| | |_) | |_| |
 /_/    \_\_|\_\_|\_\\__,_| .__/ \__, |
                          | |     __/ |
                          |_|    |___/ 

"
}

show_ascii_akkupy
check_internet

echo "Creating directories..."
sudo mkdir -p /home/$USER/nginx-proxy-manager/data || error "Failed to create data folder!"
sudo mkdir -p /home/$USER/nginx-proxy-manager/letsencrypt || error "Failed to create letsencrypt folder!"
echo "Creating a blank nginx-proxy-manager config files"
sudo touch /home/$USER/nginx-proxy-manager/config.json || error "Failed to touch config.json file!"
echo "Creating a blank docker compose file"
sudo touch /home/$USER/nginx-proxy-manager/docker-compose.yml || error "Failed to touch docker-compose.yml file!"
echo "Pre-installaton complete."
