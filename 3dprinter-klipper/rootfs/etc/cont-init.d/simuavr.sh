#!/usr/bin/with-contenv bashio

if bashio::config.false 'simulavr'; then
    bashio::log "Disable Simulavr"
    touch /etc/services.d/simulavr/down
    return
fi

# Install Simuavr
if [ ! -d "$SIMULAVR_PATH" ]; then
    echo "Get SimulAVR source"
    git clone git://git.savannah.nongnu.org/simulavr.git "$SIMULAVR_PATH"
    cd "$SIMULAVR_PATH" || exit
    make python
    make build
fi

# Add simulavr process
if [ ! -f "$ADDON_CONFIG_PATH"/bin/klipper_mcu_simulavr ]; then
    mkdir -p "$ADDON_CONFIG_PATH"/bin/
    cp /etc/klipper/config_simulavr /data/klipper/.config
    cd /data/klipper || exit
    make
    cp out/klipper.elf "$ADDON_CONFIG_PATH"/bin/klipper_mcu_simulavr.elf
fi
