#!/bin/bash


function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}


echo "Creating directories..."
sudo mkdir -p /home/$USER/nextcloud || error "Failed to create nextcloud folder!"
sudo mkdir -p /home/$USER/mysql || error "Failed to create mysql folder!"

echo "Downloading nextcloud container."
docker pull nextcloud
echo "Downloading mysql container."
docker pull mysql
echo "Initialising mysql"
docker run --name mysql \
    -e MYSQL_ROOT_PASSWORD=password \
    -e MYSQL_DATABASE=nextcloud \
    -e MYSQL_USER=nextcloud \
    -e MYSQL_PASSWORD=nextcloud \
    -v /home/$USER/mysql:/var/lib/mysql \
    --restart unless-stopped \
    -d mysql
echo "Initialising nextcloud"
docker run --name nextcloud \
    -d -p 7000:80 \
    -v /home/$USER/nextcloud:/var/www/html \
    --restart unless-stopped \
    nextcloud
echo " Done!"