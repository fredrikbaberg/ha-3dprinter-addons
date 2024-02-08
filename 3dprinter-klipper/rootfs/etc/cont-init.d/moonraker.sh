#!/usr/bin/with-contenv bashio

SRC_PATH=$ADDON_SRC_PATH/moonraker
VENV_PATH=$ADDON_VENV_PATH/moonraker
CONFIG_PATH=$ADDON_CONFIG_PATH/moonraker/config

# Get Moonraker source.
if [ ! -d "$SRC_PATH" ]; then
    bashio::log "Get Moonraker source"
    git clone https://github.com/Arksine/moonraker.git "$SRC_PATH"
fi
# Install Moonraker in virtual environment.
if [ ! -d "$VENV_PATH" ]; then
    bashio::log "Prepare Moonraker-env"
    virtualenv "$VENV_PATH"
    "$VENV_PATH"/bin/python -m pip install --upgrade pip
    "$VENV_PATH"/bin/pip install -r "$SRC_PATH"/scripts/moonraker-requirements.txt
    "$VENV_PATH"/bin/pip install msgspec uvloop
else
    bashio::log "Moonraker env already installed"
fi
# Make sure config exists.
if [ ! -f "$CONFIG_PATH"/moonraker.conf ]; then
    mkdir -p "$CONFIG_PATH"
    cp /etc/klipper/config/moonraker.conf "$CONFIG_PATH"/moonraker.conf
    ## Create log folder and file
    mkdir -p $ADDON_CONFIG_PATH/moonraker/logs
    touch $ADDON_CONFIG_PATH/moonraker/logs/moonraker.log
fi
