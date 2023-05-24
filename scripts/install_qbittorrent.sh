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