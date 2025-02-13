#!/bin/bash
sudo yum update
sudo yum install -y mysql-server
sudo mysql_secure_installation
sudo systemctl start mysql
sudo systemctl enable mysql
echo "MySQL database is installed and started"
