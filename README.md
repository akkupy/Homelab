# Homelab - Docker based Server

This repository is a collection of steps for hosting a variety of server applications using [Docker](https://www.docker.com/) and [Portainer](https://github.com/portainer/portainer) on RaspberryPi.

![alt text](https://github.com/akkupy/Homelab/blob/main/images/rpi4.jpg?raw=true)

## Prerequisite

* [Raspberry Pi 4](https://robu.in/product/raspberry-pi-4-model-b-with-4-gb-ram/)
* [Micro SD Card](https://www.amazon.in/gp/product/B082WPGKT6)
* [Heat Sink](https://robu.in/product/black-4-in-1-heat-sink-set-aluminum-for-raspberry-pi-4b/)
* [Power Supply](https://www.amazon.in/gp/product/B07XY8F3P7/)
* [Rpi4 Case With Fan](https://www.amazon.in/gp/product/B082ZQSHFZ/)
* [Micro HDMI to HDMI](https://www.amazon.in/gp/product/B08PW6W54V/)(Optional)
* [External HDD](https://www.flipkart.com/wd-1-5-tb-wired-external-hard-disk-drive-hdd/p/itmfcyh2wheuvhbk)(Optional)

## Installing Operating System

I recommend the use of [Raspberry Pi Imager](https://www.raspberrypi.com/software/) to install an operating system on to your SD card. You will need another computer with an SD card reader to install the image. Raspberry Pi Imager can be run on another Raspberry Pi, but also works on Microsoft Windows, Apple macOS, and Linux.

**USING RASPBERRY PI IMAGER**

Raspberry Pi have developed a graphical SD card writing tool that works on Mac OS, Ubuntu 18.04, and Windows called [Raspberry Pi Imager](https://www.raspberrypi.com/software/); this is the easiest option for most users since it will download the image automatically and install it to the SD card.

Download the latest version of Raspberry Pi Imager and install it. If you want to use Raspberry Pi Imager from a second Raspberry Pi, you can install it from a terminal using "sudo apt install rpi-imager". Then:

* Connect an SD card reader with the SD card inside.

* Open Raspberry Pi Imager and choose the Raspberry Pi OS Lite (64bit) from the list presented.

* Choose the SD card you wish to write your image to.

* After you have selected the operating system to install, a cog wheel will appear allowing you to open an "Advanced Options" menu.

* Set Hostname as raspberry.local and Enable SSH(password authentication) and Configure Wifi(Optional) and configure User on the advanced options.

* Review your selections and click on the Write button to begin writing data to the SD Card.

## Post OS Installation

Connect the SD Card into the Raspberry PI 4 and assemble the pi inside its case and attach the heat sink and fan.

Connect the Raspbbery pi into the network using Ethernet(Recommended) or WiFi.

SSH into the pi using the raspberrypi.local hostname or the corresponding ip address of pi given by the Router/DHCP server.

Update and Upgrade the raspberry pi using the code below

```
sudo apt update && sudo apt upgrade -y
```

### Installation of Docker and Portainer.
Run `install_docker.sh`, to install docker, and add the current user to the docker usergroup.

```
wget -qO- https://raw.githubusercontent.com/akkupy/Homelab/main/scripts/install_docker.sh | bash
```
You need to reboot/logout for changes to take effect.
<br>

Reboot for changes to take effect

```
sudo reboot
```

After a reboot, run `install_portainer.sh`, to install Portainer.io

```
wget -qO- https://raw.githubusercontent.com/akkupy/Homelab/main/scripts/install_portainer.sh | bash
```
<br>

### Login to Portainer.

<br>

* Goto raspberry_ip:9000 and then login.

* Now just click App Templates and deploy applications!.

<br>

## Update Portainer Script.

```
wget -qO- https://raw.githubusercontent.com/akkupy/Homelab/main/scripts/update_portainer.sh | bash
```

<br>

# List of Documentation files.


List of all Documents used within this project.

---

| File Name | Description |
| --------- | ----------- |
|[tailscale.md](./docs/tailscale.md)|Install and setup instructions for Tailscale(A VPN Service)|
|[nginx_proxy_manager.md](./docs/nginx_proxy_manager.md)|Install and setup instructions for Nginx Proxy Manager (NPM)|
|[Self Signed SSL Certificate](https://github.com/akkupy/Self_Signed_SSL_Cerificate)|Follow these steps for SSL Certificate Authority for Local Https Development(can be used with NPM)|
|[pi-hole.md](./docs/pi-hole.md)|Install and Setup Pi-Hole for Network-Wide Ad Block|
|[unbound.md](./docs/unbound.md)|Install and Setup Unbound , a validating, recursive, caching DNS resolver.|
|[vaultwarden.md](./docs/vaultwarden.md)|Install and Setup Vaultwarden, A privately hosted password manager|
|[rpimonitoring.md](./docs/rpimonitoring.md)|Install and Setup Raspberry Pi & Docker Monitoring, A user-friendly way to monitor the performance of your Raspberry Pi|
|[jellyfin.md](./docs/jellyfin.md)|Install and Setup Jellyfin, A Software to provide media from a dedicated server to end-user devices via multiple apps|
|[filebrowser.md](./docs/filebrowser.md)|Install and Setup Filebrowser, A file managing interface within a specified directory and it can be used to upload, delete, preview, rename and edit your files|
|[heimdall.md](./docs/heimdall.md)|Install and Setup Heimdall, Organise all those links to your most used web sites and web applications in a simple way.|
|[qbittorrent.md](./docs/qbittorrent.md)|Install and Setup Qbittorrent, An open-source software alternative to µTorrent.|
|[sonarr.md](./docs/sonarr.md)|Install and Setup sonarr, a PVR for usenet and bittorrent users.|
|[radarr.md](./docs/radarr.md)|Install and Setup radarr, A fork of Sonarr to work with movies à la Couchpotato.|
|[jackett.md](./docs/jackett.md)|Install and Setup jackett, translates queries from apps (Sonarr, SickRage, CouchPotato, Mylar, etc) into tracker-site-specific http queries, parses the html response, then sends results back to the requesting software.|
|[nextcloud.md](./docs/nextcloud.md)|Install and Setup nextcloud, A safe home for all your data. Access & share your files, calendars, contacts, mail & more from any device, on your terms.|
|[Z-Vote](https://github.com/akkupy/Z-Vote/tree/production)|Install and Setup Z-Vote, A Blockchain based Voting System|




# Contact Me
 [![telegram](https://img.shields.io/badge/Akku-000000?style=for-the-badge&logo=telegram)](https://t.me/akkupy)


# License
[![GNU GPLv3 Image](https://www.gnu.org/graphics/gplv3-127x51.png)](http://www.gnu.org/licenses/gpl-3.0.en.html)  

Homelab is Free Software: You can use, study share and improve it at your
will. Specifically you can redistribute and/or modify it under the terms of the
[GNU General Public License](https://www.gnu.org/licenses/gpl.html) as
published by the Free Software Foundation, either version 3 of the License, or
(at your option) any later version. 


