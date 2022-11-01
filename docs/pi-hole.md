# Install and setup instructions for Pi-Hole DNS Ad Blocker

## Introduction

[Pi-Hole](https://pi-hole.net/) is a network-wide **Ad Blocking** based on [DNS](https://en.wikipedia.org/wiki/Domain_Name_System) filter. It can also act as a [DHCP](https://en.wikipedia.org/wiki/Dynamic_Host_Configuration_Protocol) server.

![](https://i0.wp.com/pi-hole.net/wp-content/uploads/2018/12/dashboard.png?zoom=1.75&w=3840&ssl=1)

There is 2 options available:

- **[Pi-Hole](#pi-hole-installation)**: It's a docker with Pi-Hole only
- **[Pi-Hole-Unbound](#pi-hole-unbound-installation)**: Docker built with [Unbound](https://nlnetlabs.nl/projects/unbound/about/) software integrated for self-hosted DNS server.



## Pi-Hole Installation


## Post Installation

### Admin Password

Once deployed, open the container logs, disable `Auto-refresh logs` so you can scroll freely and look for `Assigning random password: XXXXXXXX` to get the Admin password.

![](../images/pi-hole_LogsPassword.png)

You can set a new password opening the Console through Portainer and typing `pihole -a -p` and enter the password when requested.

You can find more commands to run [here](https://docs.pi-hole.net/core/pihole-command/).

With the admin password, go to `http://<Raspberry IP>:1010/admin` to access Pi-Hole web interface and log in.

### Setting Mainstream DNS

Go to `Settings` and select `DNS` on top.

![](../images/pi-hole_SettingsDNS.png)

On the left hand side you can select anyone of the know DNS providers or insert a custom one on the right hand side (_**Note: if you are using Unbound, the custom DNS is already configured properly**_).

You can also set `Use Conditionnal Forwarding` in order for the Pi-Hole to ask your DHCP server the host name of the local IPs. For this to work, define your local network [CIDR](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing) (I've used 192.168.0.0/16 that covers all possible subnets within 192.168.x.x range), then insert the IP of your DHCP server (normally your router) and optionally a local domain name.

![](../images/pi-hole_SettingsDNS_CF.png)

If you're having loop issues with your router, then you might want to disable this option.

### Point your router or device to Pi-Hole

As each router is different to configure, I'm not going to detail here how it's done. However, you can point your router DNS to Pi-Hole IP (Raspberry IP) and it will use it as the main DNS, blocking any request included on it's blacklist.

Optionally, you can set each device to use a custom DNS and insert the IP of your Raspberry.

You can also refer to [pi-hole router setup documentation](https://docs.pi-hole.net/routers/fritzbox/) for more information.

### Adding more Ad lists

You can add more lists through `Group Management` -> `Adlists`. Then just add the list you want to use.

You can visit [The Big Blocklist Collection](https://firebog.net/) if you want to add more.

