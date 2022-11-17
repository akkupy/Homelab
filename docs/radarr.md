# Radarr

![](../images/radarr.png)

## Introduction

[Radarr](https://github.com/Radarr/Radarr) - A fork of Sonarr to work with movies à la Couchpotato.

# Media folders

We have set /movies and /downloads as optional paths, this is because it is the easiest way to get started. While easy to use, it has some drawbacks. Mainly losing the ability to hardlink (TL;DR a way for a file to exist in multiple places on the same file system while only consuming one file worth of space), or atomic move (TL;DR instant file moves, rather than copy+delete) files while processing content.

Use the optional paths if you dont understand, or dont want hardlinks/atomic moves.

The folks over at servarr.com wrote a good [write-up](https://wiki.servarr.com/docker-guide#consistent-and-well-planned-paths) on how to get started with this.

# Installation

## Method 1 (Auto):

1. **Run the following script**

```
wget -qO- https://raw.githubusercontent.com/akkupy/Homelab/main/scripts/install_radarr.sh | sudo bash
```

This will preserve any persistent data under /radarr of User Directory, you can adapt the path to whatever suits you.

**NOTE**: The downloaded files will be stored in /tdownloads folder of user directory.

## Method 2 (Manual):

### Folder Setup Script

1. First thing we need to do is setup the folder structure.The downloads folder can be changed according to your needs(Don't create download folder if already exists).

Run the following code
```
sudo mkdir -p /home/$USER/radarr
sudo mkdir -p /home/$USER/tdownloads
```

2. Now we need to move into that directory using the following:

```
cd /home/$USER/radarr
```
3. Create a folder named config for storing radarr configurations and movies for storing movies(Change tvseries folder according to your need).

Run the following code
```
sudo mkdir -p /home/$USER/radarr/config
sudo mkdir -p /home/$USER/radarr/movies
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
  radarr:
    image: lscr.io/linuxserver/radarr:latest
    container_name: radarr
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Asia/Kolkata
    volumes:
      - /home/$USER/radarr/config:/config
      - /home/$USER/radarr/movies:/movies #optional
      - /home/$USER/tdownloads:/downloads #optional
    ports:
      - 7878:7878
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

The webui is at your-ip:7878 .

(Optional): Configure Reverse Proxy using the documentation [here](https://github.com/akkupy/Homelab/blob/main/docs/nginx_proxy_manager.md#first-proxy-host-setup)