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
sudo mkdir -p /home/$USER/heimdall || error "Failed to create heimdall folder!"

echo "Downloading heimdall container."
docker pull lscr.io/linuxserver/heimdall:latest
echo "Initialising Heimdall"
docker run -d \
  --name=heimdall \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Asia/Kolkata \
  -p 4001:80 \
  -p 4002:443 \
  -v /home/$USER/heimdall/config:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/heimdall:latest
echo " Done!"