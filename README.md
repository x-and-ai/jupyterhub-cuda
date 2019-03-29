# xandai/jupyterhub-cuda

[Docker Hub Link](https://hub.docker.com/r/xandai/jupyterhub-cuda)

[GitHub Link](https://github.com/x-and-ai/jupyterhub-cuda)

## Description

This is a nvidia-docker image for deploying JupyterHub on Linux servers.

## Tags and Versions

| tag      | jupyterhub | node     | python   | cuda                |
|:--------:|:----------:|:--------:|:--------:|:-------------------:|
| 0.1.0    | 0.9.4      | 10.15.3  | 3.6.7    | 10.0-cudnn7-devel   |

## Usage

1. Make sure you have following mountable directories
    - one for all jupyterhub files
    - one for all user files

1. To start a container

``` sh
docker run --runtime=nvidia -d -t \
    -p <port>:8000 \
    -v <hub-files-dir>:/opt/jupyterhub \
    -v <user-files-dir>:/home \
    --name <container-name> \
    xandai/jupyterhub-cuda:0.1.0
```

1. To add a user

``` sh
docker exec -it <container-name> bash -c "adduser <user-name>"
```

1. To start jupyterhub

``` sh
docker exec -t -d <container-name> bash -c "jupyterhub &>> jupyterhub.log"
```

1. To enter terminal

``` sh
docker exec -it <container-name> bash
```

# TODOs

1. Add SSL certificates for HTTPS

1. Add scripts for easy user creation

1. Add scripts for easy config update
