#!/bin/bash

#Firewall configuration to allow Nginx and OpenSSH traffic
sudo ufw allow 'Nginx Full'
sudo ufw allow 'OpenSSH'
sudo ufw enable
sudo ufw status
echo "Firewall has been set up and enabled"
