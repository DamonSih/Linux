#!/bin/bash
 DATE=$(date +%d/%b/%Y:%H:%M)
 LOG_FILE=/usr/local/nginx/logs/demo2.access.log

 # Count the occurrences of each IP address and store IP addresses that have more than 10 requests within the time frame
 ABNORMAL_IP=$(tail -n5000 $LOG_FILE |grep $DATE |awk '{a[$1]++}END{for(i in 
a)if(a[i]>10)print i}')

# Blocking the IPs
 for IP in $ABNORMAL_IP; do
 if [ $(iptables -vnL |grep -c "$IP") -eq 0 ]; then
 iptables -I INPUT -s $IP -j DROP
 echo "$(date +'%F_%T') $IP" >> /tmp/drop_ip.log
 fi
 done
