#!/bin/bash

apt update  -y
apt upgrade -y
apt update  -y
apt upgrade -y

apt install nginx -y

ufw allow 'Nginx HTTP'

systemctl start nginx
systemctl enable nginx

echo completed running userdata