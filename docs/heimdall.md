# Heimdall

![](../images/heimdall-banner.png)

## Introduction

[Heimdall](https://heimdall.site/) is a way to organise all those links to your most used web sites and web applications in a simple way. Simplicity is the key to Heimdall. Why not use it as your browser start page? It even has the ability to include a search bar using either Google, Bing or DuckDuckGo.

# Installation

## Method 1 (Auto):

1. **Run the following script**

```
wget -qO- https://raw.githubusercontent.com/akkupy/Homelab/main/scripts/install_heimdall.sh | sudo bash
```

This will preserve any persistent data under /heimdall of User Directory, you can adapt the path to whatever suits you.

## Method 2 (Manual):

### Folder Setup Script

1. First thing we need to do is setup the folder structure. 

Run the following code
```
sudo mkdir -p /home/$USER/heimdall
```

2. Now we need to move into that directory using the following:

```
cd /home/$USER/heimdall
```
3. Create a folder named config for storing heimdall configurations.

Run the following code
```
sudo mkdir -p /home/$USER/heimdall/config
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
  heimdall:
    image: lscr.io/linuxserver/heimdall:latest
    container_name: heimdall
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/London
    volumes:
      - /home/$USER/heimdall/config:/config
    ports:
      - 4001:80
      - 4002:443
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

Access the WebUI using https://raspberry_ip:4001.

(Optional): Configure Reverse Proxy using the documentation [here](https://github.com/akkupy/Homelab/blob/main/docs/nginx_proxy_manager.md#first-proxy-host-setup)