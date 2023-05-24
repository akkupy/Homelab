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
sudo mkdir -p /home/$USER/pi_hole || error "Failed to create pihole folder!"

printf 'Downloading pihole Container'
# Note: FTLCONF_LOCAL_IPV4 should be replaced with your external ip.
docker run -d \
    --name pihole \
    -p 53:53/tcp -p 53:53/udp \
    -p 4000:80 \
    -e TZ="Asia/Kolkata" \
    -v "/home/$USER/pi_hole/etc-pihole:/etc/pihole" \
    -v "/home/$USER/pi_hole/etc-dnsmasq.d:/etc/dnsmasq.d" \
    --dns=127.0.0.1 --dns=1.1.1.1 \
    --restart=unless-stopped \
    --hostname pi.hole \
    -e VIRTUAL_HOST="pi.hole" \
    -e PROXY_LOCATION="pi.hole" \
    -e FTLCONF_LOCAL_IPV4="127.0.0.1" \
    pihole/pihole:latest

printf 'Starting up pihole container '
for i in $(seq 1 20); do
    if [ "$(docker inspect -f "{{.State.Health.Status}}" pihole)" == "healthy" ] ; then
        printf ' OK'
        echo -e "\n$(docker logs pihole 2> /dev/null | grep 'password:') for your pi-hole: http://${IP}/admin/"
        exit 0
    else
        sleep 3
        printf '.'
    fi

    if [ $i -eq 20 ] ; then
        echo -e "\nTimed out waiting for Pi-hole start, consult your container logs for more info (\`docker logs pihole\`)"
        exit 1
    fi
done;