#!/bin/bash

# Configure raspberry pi 
systemctl mask systemd-networkd-wait-online.service
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
sudo nano /etc/apt/apt.conf.d/20auto-upgrades
sudo reboot