#!/bin/bash
apt-get update -y
apt-get install pip python3-venv  mysql-server git docker.io -y
git clone https://github.com/BhuvanesWaran00/Sample_e-Commerce.git
mv Sample_e-Commerce app
cd app
export DB_HOST='test.c19gkk3ng7md.ap-south-1.rds.amazonaws.com' # Replace Your host
export DB_USER= 'root'                     # Replace Your User_name
export DB_PASSWORD= 'Bh101299'             # Replace Your password
export DB_NAME= 'userdata'                 # Replace Your DB_name
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
cp service.txt /etc/systemd/system/app.service
systemctl daemon-reload
systemctl start app
systemctl enable app
apt-get install nginx -y
systemctl start nginx
systemctl enable nginx
cp nginx.txt /etc/nginx/sites-available/default
systemctl restart nginx
gunicorn -b 0.0.0.0:9000 app:app