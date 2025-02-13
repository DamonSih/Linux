#!/bin/bash
sudo yum update
sudo yum install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
echo "Apache has been installed and started"
