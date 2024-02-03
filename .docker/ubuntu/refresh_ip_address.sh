#!/bin/bash

# This script is used to refresh the IP address of the seedbox on MAM

if ! command -v curl &> /dev/null; then
        apt-get update -y
        apt-get install curl -y
fi

while true;
do
    curl -c config/mam.cookies -b "mam_id=$MAM_TOKEN" -o config/mam_bonus_points_spent.log -s "https://www.myanonamouse.net/json/bonusBuy.php/?spendtype=upload&amount=Max%20Affordable%20"
    curl -c config/mam.cookies -b "mam_id=$MAM_TOKEN" -o config/mam_ip_refresh.log -s "https://t.myanonamouse.net/json/dynamicSeedbox.php"
    echo "[$(date)] $(cat mam_ip_refresh/mam.log)"
    sleep 3600
done