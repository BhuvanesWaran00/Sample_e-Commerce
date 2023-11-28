#!/bin/bash
sudo systemctl daemon-reload
sudo systemctl start app
sudo systemctl enable app