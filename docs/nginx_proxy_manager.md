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
wget -qO-  | sudo bash
```

Your output should look something like this

```
# wget -qO-  | sudo bash
Creating directories...
Creating a blank nginx-proxy-manager config files
Setup complete.
```