#!/bin/bash

# This script is used to refresh the IP address of the seedbox on MAM

clear

while true;
do
    if ! command -v curl &> /dev/null; then
        apt-get update -y
        apt-get install curl -y
    fi
    curl -c config/mam.cookies -b "mam_id=$MAM_TOKEN" -o config/mam.log https://t.myanonamouse.net/json/dynamicSeedbox.php
    echo "[$(date)] $(cat config/mam.log)"
    sleep 3600
done