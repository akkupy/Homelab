# Jellyfin

<p align="center">
  <img src="../images/jellyfin.png" width="512"/>
</p>

## Introduction

[Jellyfin](https://jellyfin.org/) is a Free Software Media System that puts you in control of managing and streaming your media. It is an alternative to the proprietary Emby and Plex, to provide media from a dedicated server to end-user devices via multiple apps. Jellyfin is descended from Emby's 3.5.2 release and ported to the .NET Core framework to enable full cross-platform support. There are no strings attached, no premium licenses or features, and no hidden agendas: just a team who want to build something better and work together to achieve it.

## Hardware Acceleration

### OpenMAX (Raspberry Pi)

Hardware acceleration users for Raspberry Pi MMAL/OpenMAX will need to mount their /dev/vcsm and /dev/vchiq video devices inside of the container and their system OpenMax libs by passing the following options when running or creating the container:

```
--device=/dev/vcsm:/dev/vcsm
--device=/dev/vchiq:/dev/vchiq
-v /opt/vc/lib:/opt/vc/lib
```

### V4L2 (Raspberry Pi)

Hardware acceleration users for Raspberry Pi V4L2 will need to mount their /dev/video1X devices inside of the container by passing the following options when running or creating the container:

```
--device=/dev/video10:/dev/video10
--device=/dev/video11:/dev/video11
--device=/dev/video12:/dev/video12
```

# Installation

## Method 1 (Auto,**Not Recommended**):

1. **Run the following script**

```
wget -qO- https://raw.githubusercontent.com/akkupy/Homelab/main/scripts/install_jellyfin.sh | sudo bash
```

This will preserve any persistent data under /jellyfin of User Directory, you can adapt the path to whatever suits you.

**NOTE**: Inside jellyfin folder,there will be 2 folders 'movies' and 'tvseries',where you can add the movies and series.


## Method 2 (Manual,**Recommended**):

### Folder Setup Script

1. First thing we need to do is setup the folder structure. 

Run the following code
```
sudo mkdir -p /home/$USER/jellyfin
```

2. Now we need to move into that directory using the following:

```
cd /home/$USER/jellyfin
```
3. Create a folder named config for storing jellyfin configurations.

Run the following code
```
sudo mkdir -p /home/$USER/jellyfin/config
```
4. We now need to open the docker-compose.yml file using nano editor.

```
nano docker-compose.yml
```
Copy and paste the below Docker-compose exmple into the docker-compose.yml file.

NOTE : Change the TimeZone and Conflicting ports according to your needs.

**IMPORTANT NOTE:**Point the path to tvseries and movies according to your needs(External Drive is Recommended).

See example below:
[Docker-compose](https://docs.docker.com/compose/install/) example:

```yaml
version: "2.1"
services:
  jellyfin:
    image: lscr.io/linuxserver/jellyfin:latest
    container_name: jellyfin
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/London
      - JELLYFIN_PublishedServerUrl=192.168.0.5 #optional
    volumes:
      - /home/$USER/jellyfin/config:/config
      - /path/to/tvseries:/data/tvshows
      - /path/to/movies:/data/movies
    ports:
      - 8096:8096
      - 8920:8920 #optional
      - 7359:7359/udp #optional
      - 1900:1900/udp #optional
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

## Post Installation

Webui can be found at http://<your-ip>:8096

Follow the on-screen setup.

Movies placed in movies folder and tv-series placed in tvseries folder can be found in the home page.

More information can be found on the official documentation [here](https://jellyfin.org/docs/general/quick-start/).

