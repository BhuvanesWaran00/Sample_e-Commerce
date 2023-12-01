#!/bin/bash
apt-get update -y
apt-get install python3-pip python3-venv  mysql-server git docker.io httpd nginx -y
#git clone https://github.com/BhuvanesWaran00/Sample_e-Commerce.git
mv Sample_e-Commerce app
cd /var/www/html
mv app/* .
chmod +x DB_config.sh
./DB_config.sh
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
cp service.txt /etc/systemd/system/app.service
systemctl daemon-reload
systemctl start app
systemctl enable app
systemctl start nginx
systemctl enable nginx
cp nginx.txt /etc/nginx/sites-available/default
systemctl restart nginx
gunicorn -b 0.0.0.0:8000 app:app