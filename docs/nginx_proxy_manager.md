# Install and setup instructions for Nginx Proxy Manager (NPM)

## Introduction

Nginx Proxy Manager (NPM) is an easy way to accomplish reverse proxying hosts with SSL termination and as the author puts it "It has to be so easy that a monkey could do it".

## Screenshot

![NPM Screenshot](https://nginxproxymanager.com/screenshots/proxy-hosts.png)

# Installation

## Pre-Installation Steps

### Folder Setup Script

First thing we need to do is setup the folder structure and install some files that need to be in place for everything to work correctly.  

Run the following script
```
wget -qO- https://raw.githubusercontent.com/akkupy/Homelab/main/scripts/install_nginx_proxy_manager.sh | bash
```

Your output should look something like this

```
# wget -qO- https://raw.githubusercontent.com/akkupy/Homelab/main/scripts/install_nginx_proxy_manager.sh | bash
Creating directories...
Creating a blank nginx-proxy-manager config files
Creating a blank docker compose file
Pre-installaton complete.
```

Now we need to move into that directory using the following:

```
cd /home/$USER/nginx-proxy-manager
```

We now need to open the config.json file using nano editor so we can input some data.

```
nano config.json
```

Copy and paste the following into the file.

Note: Replace all “changeme” values with something unique and secure.

```
{
  "database": {
    "engine": "mysql",
    "host": "db",
    "name": "npm",
    "user": "changeme",
    "password": "changeme",
    "port": 3306
  }
}
```
Once you have done that press “Ctrl + X” then Y to save and “Enter” to exit the nano editor.

We now need to open the docker-compose.yml file using nano editor.

```
nano docker-compose.yml
```
Copy and paste the below data into the docker-compose.yml file.

Like before change all “changeme” values to match the same as set in the config.json file.

Note: Create a new password for MYSQL_ROOT_PASSWORD.

```
version: '3'
services:
  app:
    image: 'jc21/nginx-proxy-manager:latest'
    restart: unless-stopped
    ports:
      - '80:80'
      - '81:81'
      - '443:443'
    environment:
      DB_MYSQL_HOST: "db"
      DB_MYSQL_PORT: 3306
      DB_MYSQL_USER: "changeme"
      DB_MYSQL_PASSWORD: "changeme"
      DB_MYSQL_NAME: "npm"
    volumes:
      - ./data:/data
      - ./letsencrypt:/etc/letsencrypt
  db:
    image: 'jc21/mariadb-aria:latest'
    restart: unless-stopped
    environment:
      MYSQL_ROOT_PASSWORD: 'changeme'
      MYSQL_DATABASE: 'npm'
      MYSQL_USER: 'changeme'
      MYSQL_PASSWORD: 'changeme'
    volumes:
      - ./data/mysql:/var/lib/mysql
```
Once you have done that press “Ctrl + X” then Y to save and “Enter” to exit the nano editor.

To deploy the dockers run the following command:

```
sudo docker-compose up -d
```

This will take some time to finish.

Once complete you can check that the docker containers exist by typing the following:

```
sudo docker ps
```

Or you can check in Portainer by [logging in via your browser](https://github.com/akkupy/Homelab#login-to-portainer) and navigating to “Containers“.

If you see any problems like “unhealthy” Please restart the container and all should be well.

After the containers are healthy or running, Proceed to the next steps.

We want to select nginx-proxy-manager from the list od containers.  This will display lots of information regarding your container.

You will notice 3 ports listed.  Port 80, 443, and port 81.  Ports 80 and 443 are for managing your services and really shouldn't be changed.  Port 81 is for managing your lists of hosts.  It can be changed but for the reminder of this install we are going to assume it to be port 81.

> It is important before you go to the next step that you get you public IP forward though your firewall for port 80 and 443 to your NPM install.  You also need to have your DNS pointing at the IP address.  There are many ways to do this and outside the scope of this install document.  If you are not sure where to start feel free to login to the Discord chat and ask someone will help point you at different options for your setup.


## Post Install Setup

### Login to the site<br>

Now that it is installed lets setup our first proxy host.  First thing we need to do is login to the site.  Click on port 81 in the list and you will see the login screen below.

![Login](https://raw.githubusercontent.com/akkupy/Homelab/main/images/nginx-proxy-manager-Login.png)

The Default Email Address is: admin@example.com
The Default Password is: changeme

Please login and we will then change those to our own settings.

> If you get a Bad Gateway error you likely forgot to run the script on the host to setup the folders / files first although it can also happen if you leave one of the database password blank as well.  Delete the Stack and start back from the beginning.

![First Login](https://raw.githubusercontent.com/akkupy/Homelab/main/images/nginx-proxy-manager-First-Login.png)

### Update Your Email address and Password

First we need to select the User menu and select Edit Details

![User Menu](https://raw.githubusercontent.com/akkupy/Homelab/main/images/nginx-proxy-manager-User-Menu.png)

Fix your user information and save the changes.


![User Menu](https://raw.githubusercontent.com/akkupy/Homelab/main/images/nginx-proxy-manager-User-Edit-Details.png)

Now it is time to change your password.  Select the User menu again and select Change Password <br>
![User Menu](https://raw.githubusercontent.com/akkupy/Homelab/main/images/nginx-proxy-manager-User-Menu.png)

Set the password to something you like and save the changes.

![User Menu](https://raw.githubusercontent.com/akkupy/Homelab/main/images/nginx-proxy-manager-User-Change-Password.png)

## Update Default Screen

When going to the proxy with a new domain or in some cases where you used *wildcard DNS and someone goes using a DNS you don't haven't setup yet they will see the default screen.  By default this is the Congratulations Screen as shown below.  It is useful for confirming you are setup correctly but in production I prefer a 404 page or a custom page of some kind so we will go though how to set that up.

* Wildcard DNS can have security issues make sure you reach these before using them.

![Congratulations Screen](https://raw.githubusercontent.com/akkupy/Homelab/main/images/nginx-proxy-manager-Congratulations-Screen.png)

We start by going to the Settings Tab

![Settings Screen](https://raw.githubusercontent.com/akkupy/Homelab/main/images/nginx-proxy-manager-Menu-Settings.png)

Click on the 3 dots and select Edit from the list.

![3 Dots Screen](https://raw.githubusercontent.com/akkupy/Homelab/main/images/nginx-proxy-manager-Menu-Settings-Edit.png)

You will now be shown the different options you can select for your default screen.  You can have it display a 404 page, a Custom Page, or do simply redirect depending on your preference.  This is entirely up to you.  I prefer to use a 404 screen so I am going to set that now.

![Setting Edit Screen](https://raw.githubusercontent.com/akkupy/Homelab/main/images/nginx-proxy-manager-Menu-Settings-Edit-Screen.png)

There we are with the default being a 404 page.

![Settings Screen with 404](https://raw.githubusercontent.com/akkupy/Homelab/main/images/nginx-proxy-manager-Menu-Settings-404-selected.png)

So now when someone goes to a site that isn't setup yet they will see a 404 page.

![404 Page](https://raw.githubusercontent.com/akkupy/Homelab/main/images/nginx-proxy-manager-404-page.png)

Great Nginx Proxy Manager is now all setup.  In the next sections we are going to walk though setting up your first proxy host.

## First Proxy Host Setup

We are now back to the first login screen.
![First Login](https://raw.githubusercontent.com/akkupy/Homelab/main/images/nginx-proxy-manager-First-Login.png)

### Select Hosts > Proxy Hosts

![Proxy Hosts](https://raw.githubusercontent.com/akkupy/Homelab/main/images/nginx-proxy-manager-Proxy-Host.png)

Select Add Proxy Hosts

![Proxy Hosts](https://raw.githubusercontent.com/akkupy/Homelab/main/images/nginx-proxy-manager-Menu-Add-Proxy-Host.png)

We need to enter the proxy information.  In this example we are going to use the following information.

Secure External connections to the service using https.<br>
Domain Name: homer.example.com<br>
Scheme: http<br>
Forward Hostname/IP address: 192.168.1.23<br>
Port: 8902<br>
Cache Assets: Disabled<br>
Block Common Exploits: Disabled<br>
Websockets Support: Disabled<br>
Accesss List: Publicly Accessible<br>

> Most of these options should be self explanatory if you aren't sure what they do it is likely best to leave them disabled.

The most import options.<br>  
Domain Name is the public Domain name that will point at your host.<br>
Forward Hostname/IP is the server running the resource.<br>
Port is the port the service is running on that server.<br>

Two options you might want to enable are Cache Assets and Block Common Exploits they will help protect and reduce the load on your sites but they can cause problems for some sites so be aware of this before enabling.

Some applications will use Websockets if the app uses this you will need to enable it but very few applications do so.  To put it simply if you don't know what it is, than leave it disabled.


![Proxy Hosts](https://raw.githubusercontent.com/akkupy/Homelab/main/images/nginx-proxy-manager-New-Proxy-Host.png)

> Hint: Generating Certificates can be complicated I will be outlining one of the simplest ways to generate one.  There are other ways not outlined here.

Now we need to setup our secure https connection to the server.  Select the SSL tab.

## Method 1(Recommended for internet based usage):

Under SSL Certificates we are going to select Request a new SSL Certificate.

I am also going to select Force SSL this will prevent non-secure connections from being used.  

I will agree to the terms after reading them you should at least review them once so you understand the terms of service.

It should have your correct email address listed if it doesn't please fix as this is where you will get alerts if there is an issue with the Certificate.

![Proxy Hosts](https://raw.githubusercontent.com/akkupy/Homelab/main/images/nginx-proxy-manager-New-Proxy-Host-SSL.png)

Once you click Save it will generate a new certificate this can take a few minutes to do.

## Method 2(Recommended for Local usage and usage with [tailscale](https://github.com/akkupy/Homelab/blob/main/docs/tailscale.md)):

You can use a self generated SSL certificate(which can be generated [here](https://github.com/akkupy/Self_Signed_SSL_Cerificate)).In this case select Custom under the SSL Certificates and upload the key and certificate generated.

### Post SSL Certificate Gerneration

Assuming there are no errors your new host has been created and you will be returned to the proxy host screen.  Below is an example of what the screen will look like with several hosts added.

![NPM Screenshot](https://nginxproxymanager.com/screenshots/proxy-hosts.png)

# Additional documentation

Additional documentation can be found at https://nginxproxymanager.com/guide/ .

(Optional): Configure Reverse Proxy using the documentation [here](https://github.com/akkupy/Homelab/blob/main/docs/nginx_proxy_manager.md#first-proxy-host-setup)