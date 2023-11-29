#!/bin/bash
systemctl daemon-reload
systemctl start app
systemctl enable app