# Homelab - Docker based Server

This repository is a collection of steps for hosting a variety of server applications using [Docker](https://www.docker.com/) and [Portainer](https://github.com/portainer/portainer) on RaspberryPi.

![alt text](https://github.com/akkupy/Homelab/blob/main/images/rpi4.jpg?raw=true)

### Installation of Docker and Portainer.
Run `install_docker.sh`, to install docker, and add the current user to the docker usergroup.

```
wget -qO- https://raw.githubusercontent.com/akkupy/Homelab/main/scripts/install_docker.sh | bash
```
You need to reboot/logout for changes to take effect.

### Reboot for changes to take effect

```
sudo reboot
```

After a reboot, run `install_portainer.sh`, to install Portainer.io

```
wget -qO- https://raw.githubusercontent.com/akkupy/Homelab/main/scripts/install_portainer.sh | bash
```

### Login to Portainer.

Goto raspberry_ip:9000 and then login.

Now just click App Templates and deploy applications!.

### List of Documentation files.


List of all Documents used within this project.

---

| File Name | Description |
| --------- | ----------- |
|[tailscale.md](./docs/tailscale.md)|Install and setup instructions for Tailscale(A VPN Service)|
|[nginx_proxy_manager.md](./docs/nginx_proxy_manager.md)|Install and setup instructions for Nginx Proxy Manager (NPM)|
|[Self Signed SSL Certificate](https://github.com/akkupy/Self_Signed_SSL_Cerificate)|Follow these steps for SSL Certificate Authority for Local Https Development(can be used with NPM)|
|[pi-hole.md](./docs/pi-hole.md)|Install and Setup Pi-Hole for Network-Wide Ad Block|
|[vaultwarden.md](./docs/vaultwarden.md)|Install and Setup Vaultwarden, A privately hosted password manager|
|[jellyfin.md](./docs/jellyfin.md)|Install and Setup Jellyfin, A Software to provide media from a dedicated server to end-user devices via multiple apps|
|[filebrowser.md](./docs/filebrowser.md)|Install and Setup Filebrowser, A file managing interface within a specified directory and it can be used to upload, delete, preview, rename and edit your files|
|[heimdall.md](./docs/heimdall.md)|Install and Setup Heimdall, Organise all those links to your most used web sites and web applications in a simple way.|
|[qbittorrent.md](./docs/qbittorrent.md)|Install and Setup Qbittorrent, An open-source software alternative to µTorrent.|
|[sonarr.md](./docs/sonarr.md)|Install and Setup sonarr, a PVR for usenet and bittorrent users.|
|[radarr.md](./docs/radarr.md)|Install and Setup radarr, A fork of Sonarr to work with movies à la Couchpotato.|




# Contact Me
 [![telegram](https://img.shields.io/badge/Akku-000000?style=for-the-badge&logo=telegram)](https://t.me/akkupy)


# License
[![GNU GPLv3 Image](https://www.gnu.org/graphics/gplv3-127x51.png)](http://www.gnu.org/licenses/gpl-3.0.en.html)  

Homelab is Free Software: You can use, study share and improve it at your
will. Specifically you can redistribute and/or modify it under the terms of the
[GNU General Public License](https://www.gnu.org/licenses/gpl.html) as
published by the Free Software Foundation, either version 3 of the License, or
(at your option) any later version. 


