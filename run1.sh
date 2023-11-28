#!/bin/bash
apt-get update -y
apt-get install pip python3-venv -y
git clone https://github.com/BhuvanesWaran00/Sample_e-Commerce.git
mv Sample_e-Commerce app
cd app
python3 -m venv venv
source venv/bin/activate
pip install gunicorn
pip install Flask
pip install -r req.txt
cp service.txt /etc/systemd/system/app.service
chmod 100 run1.sh
chmod 100 run2.sh
chmod 100 run3.sh
gunicorn -b 0.0.0.0:8800 app:app
