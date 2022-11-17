#!/bin/bash


function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}


echo "Creating directories..."
sudo mkdir -p /home/$USER/radarr || error "Failed to create radarr folder!"
sudo mkdir -p /home/$USER/radarr/movies || error "Failed to create movies folder!"
sudo mkdir -p /home/$USER/radarr/config || error "Failed to create config folder!"

echo "Downloading radarr container."
docker pull lscr.io/linuxserver/radarr:latest
echo "Initialising radarr"
docker run -d \
  --name=radarr \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Asia/Kolkata \
  -p 7878:7878 \
  -v /home/$USER/radarr/config:/config \
  -v /home/$USER/radarr/movies:/movies `#optional` \
  -v /home/$USER/tdownloads:/downloads `#optional` \
  --restart unless-stopped \
  lscr.io/linuxserver/radarr:latest
echo " Done!"