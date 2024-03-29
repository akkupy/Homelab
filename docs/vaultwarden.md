# Vaultwarden

<p align="center">
  <img src="../images/bitwarden.png" width="512"/>
</p>

## Introduction

Bitwarden is a free/freemium open-source password management service that stores sensitive information such as website credentials in an encrypted vault. The platform offers a variety of client applications including a web interface, desktop applications, browser extensions, mobile apps, and a command-line interface.

### Vaultwarden

Alternative implementation of the Bitwarden server API written in Rust and compatible with [upstream Bitwarden clients](https://bitwarden.com/download/)*, perfect for self-hosted deployment where running the official resource-heavy service might not be ideal.

#### ⚠️**IMPORTANT**⚠️: When using this server, please report any bugs or suggestions to [vaultwarden](https://github.com/dani-garcia/vaultwarden/), regardless of whatever clients you are using (mobile, desktop, browser...). DO NOT use the official support channels.

# Installation

## Method 1 (Auto):

1. **Run the following script**

```
wget -qO- https://raw.githubusercontent.com/akkupy/Homelab/main/scripts/install_vaultwarden.sh | bash
```

This will preserve any persistent data under /vaultwarden of User Directory, you can adapt the path to whatever suits you.

## Method 2 (Manual):

### Folder Setup Script

1. First thing we need to do is setup the folder structure. 

Run the following code
```
sudo mkdir -p /home/$USER/vaultwarden
```

2. Now we need to move into that directory using the following:

```
cd /home/$USER/vaultwarden
```
3. Pull the docker image and mount a volume from the host for persistent storage:

```
docker pull vaultwarden/server:latest
docker run -d --name vaultwarden -v /home/$USER/vaultwarden:/data/ -p 4001:80 vaultwarden/server:latest
```
This will preserve any persistent data under /vaultwarden of User Directory, you can adapt the path to whatever suits you.


**IMPORTANT**: Some web browsers, like Chrome, disallow the use of Web Crypto APIs in insecure contexts. In this case, you might get an error like `Cannot read property 'importKey'`. To solve this problem, you need to access the web vault from HTTPS. 

2. This can be configured in [vaultwarden directly](https://github.com/dani-garcia/vaultwarden/wiki/Enabling-HTTPS) or using a third-party reverse proxy [NPM](https://github.com/akkupy/Homelab/blob/main/docs/nginx_proxy_manager.md)(Recommended).

If you have an available domain name, you can get HTTPS certificates with [Let's Encrypt](https://letsencrypt.org/), or you can generate [self-signed certificates](https://github.com/akkupy/Self_Signed_SSL_Cerificate). Some proxies automatically do this step, like Caddy.

# Post Installation

(Optional): Configure Reverse Proxy using the documentation [here](https://github.com/akkupy/Homelab/blob/main/docs/nginx_proxy_manager.md#first-proxy-host-setup)

Access the Web UI by going to <https://raspberrypi_ip:4001> or by using the Nginx Reverse Proxy Domain Address.

Sign up a new account and start using the service.