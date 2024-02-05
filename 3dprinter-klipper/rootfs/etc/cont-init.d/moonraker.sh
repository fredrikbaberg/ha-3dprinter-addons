#!/usr/bin/with-contenv bashio

# Install Moonraker
if [ ! -d "$MOONRAKER_PATH" ]; then
    echo "Get Moonraker source"
    git clone https://github.com/Arksine/moonraker.git "$MOONRAKER_PATH" --depth 1
fi
if [ ! -d "$MOONRAKER_VENV_PATH" ]; then
    echo "Prepare Moonraker-env"
    virtualenv "$MOONRAKER_VENV_PATH"
    "$MOONRAKER_VENV_PATH"/bin/python -m pip install --upgrade pip
    "$MOONRAKER_VENV_PATH"/bin/pip install -r "$MOONRAKER_PATH"/scripts/moonraker-requirements.txt
    "$MOONRAKER_VENV_PATH"/bin/pip install msgspec uvloop
fi

# Make sure config exists.
if [ ! -f "$ADDON_CONFIG_PATH"/moonraker/config/moonraker.conf ]; then
    mkdir -p "$ADDON_CONFIG_PATH"/moonraker/config
    cp /etc/klipper/moonraker.conf "$ADDON_CONFIG_PATH"/moonraker/config/moonraker.conf
fi
