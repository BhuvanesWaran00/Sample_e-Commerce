#!/bin/bash
apt-get install nginx -y
systemctl start nginx
systemctl enable nginx
cp nginx.txt /etc/nginx/sites-available/default
systemctl restart nginx