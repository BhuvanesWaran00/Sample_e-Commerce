#!/bin/bash
sudo apt-get install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo cp nginx.txt /etc/nginx/sites-available/default
sudo systemctl restart nginx