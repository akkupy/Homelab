# Nextcloud

![](../images/nextcloud.png)

## Introduction

[Nextcloud](https://nextcloud.com/),A safe home for all your data. Access & share your files, calendars, contacts, mail & more from any device, on your terms.

# Installation

## Method 1 (Auto):

1. **Run the following script**

```
wget -qO- https://raw.githubusercontent.com/akkupy/Homelab/main/scripts/install_nextcloud.sh | bash
```

This will preserve any persistent data under /nextcloud and /mysql of User Directory, you can adapt the path to whatever suits you.


## Method 2 (Manual):

### Folder Setup Script

1. First thing we need to do is setup the folder structure.

Run the following code
```
sudo mkdir -p /home/$USER/nextcloud
sudo mkdir -p /home/$USER/mysql
```

2. Now we need to move into that directory using the following:

```
cd /home/$USER/nextcloud
```

3. We now need to open the docker-compose.yml file using nano editor.

```
nano docker-compose.yml
```
Copy and paste the below Docker-compose exmple into the docker-compose.yml file.

NOTE : Change the TimeZone and Conflicting ports according to your needs.

See example below:
[Docker-compose](https://docs.docker.com/compose/install/) example:

```yaml
version: "2.1"
services:
  nextcloud:
    image: nextcloud
    container_name: nextcloud
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Asia/Kolkata
    volumes:
      - /home/$USER/nextcloud:/var/www/html/
    ports:
      - 7000:80
    restart: unless-stopped
    networks:
      - nextcloud_network
    depends_on:
      - mysql
  mysql:
    image: mysql
    container_name: mysql
    environment:
      - MYSQL_ROOT_PASSWORD=password
      - MYSQL_DATABASE=nextcloud
      - MYSQL_USER=nextcloud
      - MYSQL_PASSWORD=nextcloud
    volumes:
      - /home/$USER/mysql:/var/lib/mysql
    restart: unless-stopped
    networks:
      - nextcloud_network

networks:
    nextcloud_network:
      driver: bridge


```
4. Once you have done that press “Ctrl + X” then Y to save and “Enter” to exit the nano editor.

5. To deploy the dockers run the following command:

```
sudo docker-compose up -d
```

This will take some time to finish.

6. Once complete you can check that the docker containers exist by typing the following:

```
sudo docker ps
```

Or you can check in Portainer by [logging in via your browser](https://github.com/akkupy/Homelab#login-to-portainer) and navigating to “Containers“.

If you see any problems like “unhealthy” Please restart the container and all should be well.

# Post Installation

The webui is at your-ip:7000.

Create a new admin username and password in the post-installation menu and set the database as mysql with username->nextcloud password->nextcloud database->nextcloud and host->mysql and Click Install.

(Optional): Configure Reverse Proxy using the documentation [here](https://github.com/akkupy/Homelab/blob/main/docs/nginx_proxy_manager.md#first-proxy-host-setup)
# Troubleshooting

[Refer here](https://help.nextcloud.com/t/the-polling-url-does-not-start-with-https-despite-the-login-url-started-with-https/137576), Incase you have trouble in log in or connecting client apps.

