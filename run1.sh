#!/bin/bash
sudo apt-get update -y
sudo apt-get install pip python3-venv  mysql-server -y
git clone https://github.com/BhuvanesWaran00/Sample_e-Commerce.git
mv Sample_e-Commerce app
cd app
python3 -m venv venv
source venv/bin/activate
pip install gunicorn
pip install Flask
pip install -r req.txt
sudo cp service.txt /etc/systemd/system/app.service
sudo chmod 100 run1.sh
sudo chmod 100 run2.sh
sudo chmod 100 run3.sh
sudo ./run2.sh
sudo ./run3.sh
sudo gunicorn -b 0.0.0.0:8080 app:app