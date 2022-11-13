#!/bin/bash


function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}


echo "Creating directories..."
sudo mkdir -p /home/$USER/qbittorrent || error "Failed to create qbittorrent folder!"
sudo mkdir -p /home/$USER/tdownloads || error "Failed to create downloads folder!"

echo "Downloading qbittorrent container."
docker pull lscr.io/linuxserver/qbittorrent:latest
echo "Initialising qbittorrent"
docker run -d \
  --name=qbittorrent \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Asia/Kolkata \
  -e WEBUI_PORT=8080 \
  -p 8080:8080 \
  -p 6881:6881 \
  -p 6881:6881/udp \
  -v /home/$USER/qbittorrent/config:/config \
  -v /home/$USER/tdownloads:/downloads \
  --restart unless-stopped \
  lscr.io/linuxserver/qbittorrent:latest
echo " Done!"