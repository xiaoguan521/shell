#!/bin/bash

# 创建 ubuntu 目录并进入
mkdir -p ubuntu && cd ubuntu

# 创建 docker-compose.yml 文件并写入内容
cat <<EOT >> docker-compose.yml
version: '3.5'

services:
    ubuntu-xfce-vnc:
        container_name: xfce
        image: imlala/ubuntu-xfce-vnc-novnc:latest
        shm_size: "2gb"
        ports:
            - 5555:5900
            - 6666:6080
        devices:
            - /dev/snd
        environment:
            - VNC_PASSWD=xiaochen
            - GEOMETRY=1920x1080
            - DEPTH=24
            - 'ALSADEV=hw:2,0'
        volumes:
            - ./Downloads:/root
        restart: unless-stopped
EOT

# 启动容器
docker-compose up -d
