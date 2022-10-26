# Homelab

This repository is a collection of steps for hosting a variety of server applications using [Docker](https://www.docker.com/) and [Portainer](https://github.com/portainer/portainer) on RaspberryPi.

### Installation
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
wget -qO- https://raw.githubusercontent.com/akkupy/main/scripts/install_portainer.sh | bash

```

### Login to Portainer.

Goto raspberry_ip:9000 and then login.

Now just click App Templates and deploy applications!.