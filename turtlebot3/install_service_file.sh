#!/bin/bash

sudo cp turtlebotstart.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable turtlebotstart.service
sudo systemctl start turtlebotstart.service