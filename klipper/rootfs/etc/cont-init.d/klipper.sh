#!/usr/bin/with-contenv bashio

if [ ! -d /data/klipper ]; then
    git clone https://github.com/KevinOConnor/klipper /data/klipper
fi

if [ ! -d /data/klippy-env ]; then
    virtualenv /data/klippy-env
    /data/klippy-env/bin/pip install -r /data/klipper/scripts/klippy-requirements.txt
fi
