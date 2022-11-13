# Qbittorrent

![](../images/qbittorrent-icon.png)

## Introduction

The [Qbittorrent](https://www.qbittorrent.org/) project aims to provide an open-source software alternative to µTorrent. qBittorrent is based on the Qt toolkit and libtorrent-rasterbar library.

# Installation

## Method 1 (Auto):

1. **Run the following script**

```
wget -qO- https://raw.githubusercontent.com/akkupy/Homelab/main/scripts/install_qbittorrent.sh | sudo bash
```

This will preserve any persistent data under /qbittorrent of User Directory, you can adapt the path to whatever suits you.

**NOTE**: The downloaded files will be stored in /tdownloads folder of user directory.

## Method 2 (Manual):

### Folder Setup Script

1. First thing we need to do is setup the folder structure. (The downloads folder can be changed according to your needs.)

Run the following code
```
sudo mkdir -p /home/$USER/qbittorrent
sudo mkdir -p /home/$USER/tdownloads
```

2. Now we need to move into that directory using the following:

```
cd /home/$USER/qbittorrent
```
3. Create a folder named config for storing qbittorrent configurations.

Run the following code
```
sudo mkdir -p /home/$USER/qbittorrent/config
```
4. We now need to open the docker-compose.yml file using nano editor.

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
  qbittorrent:
    image: lscr.io/linuxserver/qbittorrent:latest
    container_name: qbittorrent
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Asia/Kolkata
      - WEBUI_PORT=8080
    volumes:
      - /path/to/appdata/config:/config
      - /path/to/downloads:/downloads
    ports:
      - 8080:8080
      - 6881:6881
      - 6881:6881/udp
    restart: unless-stopped
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

The webui is at your-ip:8080 and the default username/password is admin/adminadmin.

Change username/password via the webui in the webui section of settings.

(Optional): Configure Reverse Proxy using the documentation [here](https://github.com/akkupy/Homelab/blob/main/docs/nginx_proxy_manager.md#first-proxy-host-setup)