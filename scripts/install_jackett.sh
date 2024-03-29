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
sudo mkdir -p /home/$USER/jackett || error "Failed to create jackett folder!"
sudo mkdir -p /home/$USER/jackett/config || error "Failed to create config folder!"

echo "Downloading jackett container."
docker pull lscr.io/linuxserver/jackett:latest
echo "Initialising jackett"
docker run -d \
  --name=jackett \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Asia/Kolkata \
  -e AUTO_UPDATE=true `#optional` \
  -p 9117:9117 \
  -v /home/$USER/jackett/config:/config \
  -v /home/$USER/tdownloads:/downloads \
  --restart unless-stopped \
  lscr.io/linuxserver/jackett:latest
echo " Done!"