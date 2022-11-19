# Jackett

![](../images/jackett-banner.png)

## Introduction

[Jackett](https://github.com/Jackett/Jackett) works as a proxy server: it translates queries from apps (Sonarr, SickRage, CouchPotato, Mylar, etc) into tracker-site-specific http queries, parses the html response, then sends results back to the requesting software. This allows for getting recent uploads (like RSS) and performing searches. Jackett is a single repository of maintained indexer scraping & translation logic - removing the burden from other apps.

# Installation

## Method 1 (Auto):

1. **Run the following script**

```
wget -qO- https://raw.githubusercontent.com/akkupy/Homelab/main/scripts/install_jackett.sh | sudo bash
```

This will preserve any persistent data under /jackett of User Directory, you can adapt the path to whatever suits you.

## Method 2 (Manual):

### Folder Setup Script

1. First thing we need to do is setup the folder structure.Create downloads folder only if not already exists.

Run the following code
```
sudo mkdir -p /home/$USER/jackett
sudo mkdir -p /home/$USER/tdownloads
```

2. Now we need to move into that directory using the following:

```
cd /home/$USER/jackett
```
3. Create a folder named config for storing jackett configurations.

Run the following code
```
sudo mkdir -p /home/$USER/jackett/config
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
  jackett:
    image: lscr.io/linuxserver/jackett:latest
    container_name: jackett
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Asia/Kolkata
      - AUTO_UPDATE=true #optional
    volumes:
      - /home/$USER/jackett/config:/config
      - /home/$USER/tdownloads:/downloads
    ports:
      - 9117:9117
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

The webui is at your-ip:9117 .

(Optional): Configure Reverse Proxy using the documentation [here](https://github.com/akkupy/Homelab/blob/main/docs/nginx_proxy_manager.md#first-proxy-host-setup)