# Vaultwarden

<p align="center">
  <img src="../images/bitwarden.png" width="512"/>
</p>

## Introduction

Alternative implementation of the Bitwarden server API written in Rust and compatible with [upstream Bitwarden clients](https://bitwarden.com/download/)*, perfect for self-hosted deployment where running the official resource-heavy service might not be ideal.

#### ⚠️**IMPORTANT**⚠️: When using this server, please report any bugs or suggestions to [vaultwarden](https://github.com/dani-garcia/vaultwarden/), regardless of whatever clients you are using (mobile, desktop, browser...). DO NOT use the official support channels.

# Installation

1. **Run the following script**

```
wget -qO- https://raw.githubusercontent.com/akkupy/Homelab/main/scripts/install_vaultwarden.sh | sudo bash
```

This will preserve any persistent data under /vaultwarden of User Directory, you can adapt the path to whatever suits you.

**IMPORTANT**: Some web browsers, like Chrome, disallow the use of Web Crypto APIs in insecure contexts. In this case, you might get an error like `Cannot read property 'importKey'`. To solve this problem, you need to access the web vault from HTTPS. 

This can be configured in [vaultwarden directly](https://github.com/dani-garcia/vaultwarden/wiki/Enabling-HTTPS) or using a third-party reverse proxy ([some examples](https://github.com/dani-garcia/vaultwarden/wiki/Proxy-examples)).

If you have an available domain name, you can get HTTPS certificates with [Let's Encrypt](https://letsencrypt.org/), or you can generate [self-signed certificates](https://github.com/akkupy/Self_Signed_SSL_Cerificate). Some proxies automatically do this step, like Caddy.

# Post Installation

Access the Web UI by Going to <https://raspberrypi_ip:4001>