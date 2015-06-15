#!/bin/bash

sudo docker run -t -i -d --privileged=true --name tray-httpd --link tray-mysql:tray-mysql -p 80:80  -v /home/honjoya/docker/www:/var/www/html/ tray-httpd

