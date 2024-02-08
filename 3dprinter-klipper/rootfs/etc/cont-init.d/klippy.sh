#!/usr/bin/with-contenv bashio

SRC_PATH=$ADDON_SRC_PATH/klipper
VENV_PATH=$ADDON_VENV_PATH/klipper
CONFIG_PATH=$ADDON_CONFIG_PATH/moonraker/config

# Get Klipper source.
if [ ! -d "$SRC_PATH" ]; then
    bashio::log "Get Klipper source"
    git clone https://github.com/Klipper3d/klipper "$SRC_PATH"
else
    echo "Klipper already installed"
fi
# Install Klipper in virtual environment.
if [ ! -d "$VENV_PATH" ]; then
    bashio::log "Prepare Klippy-env"
    virtualenv "$VENV_PATH"
    "$VENV_PATH"/bin/python -m pip install --upgrade pip
    "$VENV_PATH"/bin/pip install -r "$SRC_PATH"/scripts/klippy-requirements.txt
else
    bashio::log "Klippy env already installed"
fi
# Make sure config file(s) exists.
if [ ! -d "$CONFIG_PATH" ]; then
    mkdir -p "$CONFIG_PATH"
    cp -R /etc/klipper/config/* "$CONFIG_PATH"
    ## Create log folder and file
    mkdir -p $ADDON_CONFIG_PATH/moonraker/logs
    touch $ADDON_CONFIG_PATH/moonraker/logs/klippy.log
fi

# Build and add host process, if set.
if bashio::config.true 'host_mcu'; then
    bashio::log "Enable host process."
    BIN_PATH=$ADDON_CONFIG_PATH/bin
    if [ ! -f "$BIN_PATH"/klipper_mcu_host ]; then
        mkdir -p "$BIN_PATH"
        cp /etc/klipper/config_host_mcu "$SRC_PATH"/.config
        cd "$SRC_PATH" || exit
        make
        cp out/klipper.elf "$BIN_PATH"/klipper_mcu_host
    fi
    rm -f /etc/services.d/klipper_host/down
else
    touch /etc/services.d/klipper_host/down
fi
