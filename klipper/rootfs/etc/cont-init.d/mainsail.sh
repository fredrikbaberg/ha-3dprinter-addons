#!/usr/bin/with-contenv bashio

if [ ! -d /data/mainsail ]; then
    mkdir -p /data/mainsail
    cd /data/mainsail
    wget -q -O mainsail.zip https://github.com/mainsail-crew/mainsail/releases/latest/download/mainsail.zip && unzip mainsail.zip && rm mainsail.zip
fi
