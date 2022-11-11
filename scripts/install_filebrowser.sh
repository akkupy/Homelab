#!/bin/bash


function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}


echo "Creating directories..."
sudo mkdir -p /home/$USER/filebrowser || error "Failed to create filebrowser folder!"

echo "Downloading filebrowser container."
docker pull filebrowser/filebrowser:latest
echo "Initialising filebrowser"
docker run -d \
    --name filebrowser \
    --restart unless-stopped \
    -v /home/$USER:/srv \
    -v /home/$USER/filebrowser/filebrowser.db:/database/filebrowser.db \
    -v /home/$USER/filebrowser/settings.json:/config/settings.json \
    -e PUID=$(id -u) \
    -e PGID=$(id -g) \
    -p 8123:80 \
    filebrowser/filebrowser:latest
echo " Done!"