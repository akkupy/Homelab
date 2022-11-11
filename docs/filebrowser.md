# Filebrowser

![Preview](https://user-images.githubusercontent.com/5447088/50716739-ebd26700-107a-11e9-9817-14230c53efd2.gif)


## Introduction

[Filebrowser](https://filebrowser.org/) provides a file managing interface within a specified directory and it can be used to upload, delete, preview, rename and edit your files. It allows the creation of multiple users and each user can have its own directory. It can be used as a standalone app.

## Installation

1. **Run the following script**

```
wget -qO- https://raw.githubusercontent.com/akkupy/Homelab/main/scripts/install_filebrowser.sh | sudo bash
```

This will preserve any persistent data under /filebrowser of User Directory, you can adapt the path to whatever suits you.

## Post Installation

Access the web UI through http://raspberry_ip:8123 or using reverse proxy.

**NOTE**: Default username: admin and password: admin