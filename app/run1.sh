#!/bin/bash
python3 -m venv venv
source venv/bin/activate
pip install -r req.txt
cp service.txt /etc/systemd/system/app.service
chmod 100 run1.sh
chmod 100 run2.sh
chmod 100 run3.sh
./run2.sh
./run3.sh
gunicorn -b 0.0.0.0:80 app:app