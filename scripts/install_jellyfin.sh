#!/bin/bash


function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}


echo "Creating directories..."
sudo mkdir -p /home/$USER/jellyfin || error "Failed to create jellyfin folder!"
sudo mkdir -p /home/$USER/jellyfin/config || error "Failed to create config folder!"
sudo mkdir -p /home/$USER/jellyfin/movies || error "Failed to create movies folder!"
sudo mkdir -p /home/$USER/jellyfin/tvseries || error "Failed to create tvseries folder!"

echo "Downloading jellyfin container."
docker pull lscr.io/linuxserver/jellyfin:latest
echo "Initialising jellyfin"
docker run -d \
  --name=jellyfin \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Asia/Kolkata \
  -p 8096:8096 \
  -p 8920:8920 `#optional` \
  -p 7359:7359/udp `#optional` \
  -p 1900:1900/udp `#optional` \
  -v /home/$USER/jellyfin/config:/config \
  -v /home/$USER/jellyfin/tvseries:/data/tvshows \
  -v /home/$USER/jellyfin/movies:/data/movies \
  --restart unless-stopped \
  lscr.io/linuxserver/jellyfin:latest
echo " Done!"