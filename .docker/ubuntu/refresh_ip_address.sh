#!/bin/bash

while true;
do
    if ! command -v curl &> /dev/null; then
        apt-get update -y
        apt-get install curl -y
    fi
    curl -c config/mam.cookies -b "mam_id=$MAM_TOKEN" -o config/mam.log https://t.myanonamouse.net/json/dynamicSeedbox.php
    sleep 3600
done