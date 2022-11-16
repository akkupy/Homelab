#!/bin/bash


function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}


echo "Creating directories..."
sudo mkdir -p /home/$USER/sonarr || error "Failed to create sonarr folder!"
sudo mkdir -p /home/$USER/sonarr/tvseries || error "Failed to create tvseries folder!"
sudo mkdir -p /home/$USER/sonarr/config || error "Failed to create config folder!"

echo "Downloading sonarr container."
docker pull lscr.io/linuxserver/sonarr:latest
echo "Initialising sonarr"
docker run -d \
  --name=sonarr \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Asia/Kolkata \
  -p 8989:8989 \
  -v /home/$USER/sonarr/config:/config \
  -v /home/$USER/sonarr/tvseries:/tv `#optional` \
  -v /home/$USER/tdownloads:/downloads `#optional` \
  --restart unless-stopped \
  lscr.io/linuxserver/sonarr:latest
echo " Done!"