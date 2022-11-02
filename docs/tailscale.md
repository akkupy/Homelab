# Tailscale

## Introduction

[Tailscale](https://tailscale.com/) lets you easily manage access to private resources, quickly SSH into devices on your network, and work securely from anywhere in the world.

![](../images/Tailscale.jpg)

# Installation
 
Install with one command
```
curl -fsSL https://raw.githubusercontent.com/akkupy/Homelab/main/scripts/install_tailscale.sh | sh
```

Log in to start using Tailscale by running:

```
tailscale up
```
OR

```
sudo tailscale up
```

You’re connected! You can find your Tailscale IPv4 address by running:

```
tailscale ip -4
```

If the device you added is a server or remotely-accessed device, you may want to consider [disabling key expiry](https://tailscale.com/kb/1028/key-expiry/) to prevent the need to periodically re-authenticate.
