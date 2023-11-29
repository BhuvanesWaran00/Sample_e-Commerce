#!/bin/bash
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
gunicorn -b 0.0.0.0:80 app:app