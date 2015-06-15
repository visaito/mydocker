#!/bin/bash

echo "###############################################";
echo "Ireimos realizar o pull da Image do Docker !\n";
echo "Este processo poderá demorar! Vá tomar um café";
echo "###############################################";
echo "\n";

docker build -t tray-httpd ./
