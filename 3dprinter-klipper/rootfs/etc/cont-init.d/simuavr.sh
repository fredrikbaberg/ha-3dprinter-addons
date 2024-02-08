#!/usr/bin/with-contenv bashio

SRC_PATH=$ADDON_SRC_PATH/simulavr

if bashio::config.false 'simulavr'; then
    bashio::log "Keep Simulavr disabled."
    touch /etc/services.d/simulavr/down
    return
else
    rm -f /etc/services.d/simulavr/down
fi

# Install Simuavr
if [ ! -d "$SRC_PATH" ]; then
    echo "Get SimulAVR source"
    git clone git://git.savannah.nongnu.org/simulavr.git "$SRC_PATH"
    cd "$SRC_PATH" || exit
    make python
    make build
fi

# Add simulavr process
BIN_PATH=$ADDON_CONFIG_PATH/bin
if [ ! -f "$BIN_PATH"/klipper_mcu_simulavr ]; then
    mkdir -p "$BIN_PATH"
    cp /etc/klipper/config_simulavr "$ADDON_SRC_PATH"/klipper/.config
    cd "$ADDON_SRC_PATH"/klipper || exit
    make
    cp out/klipper.elf "$BIN_PATH"/klipper_mcu_simulavr.elf
fi
