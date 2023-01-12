#!/usr/bin/with-contenv bashio

if [ ! -d /data/klipper ]; then
    git clone https://github.com/Arksine/moonraker.git /data/moonraker
fi

if [ ! -d /data/moonraker-env ]; then
    virtualenv /data/moonraker-env
    /data/moonraker-env/bin/pip install -r /data/moonraker/scripts/moonraker-requirements.txt
fi