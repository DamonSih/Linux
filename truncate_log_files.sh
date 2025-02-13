#!/bin/bash
sudo find /var/log/ -type f -name "*.log" -exec truncate -s 0 {} \;
echo ”System log is cleared now"
