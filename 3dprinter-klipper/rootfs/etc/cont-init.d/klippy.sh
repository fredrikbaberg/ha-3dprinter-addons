#!/usr/bin/with-contenv bashio

# Install Klipper
if [ ! -d "$KLIPPER_PATH" ]; then
    echo "Get Klipper source"
    git clone https://github.com/Klipper3d/klipper "$KLIPPER_PATH" --depth 1
else
    echo "Klipper already installed"
fi
if [ ! -d "$KLIPPER_VENV_PATH" ]; then
    echo "Prepare Klippy-env"
    virtualenv "$KLIPPER_VENV_PATH"
    "$KLIPPER_VENV_PATH"/bin/python -m pip install --upgrade pip
    "$KLIPPER_VENV_PATH"/bin/pip install -r "$KLIPPER_PATH"/scripts/klippy-requirements.txt
else
    echo "Klippy env already installed"
fi

# Add host simulator process
if [ ! -f "$ADDON_CONFIG_PATH"/bin/klipper_mcu_sim ]; then
    mkdir -p "$ADDON_CONFIG_PATH"/bin/
    cp /etc/klipper/config_host_simulator /data/klipper/.config
    cd /data/klipper || exit
    make
    ./scripts/flash-linux.sh
    cp /usr/local/bin/klipper_mcu "$ADDON_CONFIG_PATH"/bin/klipper_mcu_sim
fi

# Make sure config file exists.
if [ ! -f "$ADDON_CONFIG_PATH"/moonraker/config/printer.cfg ]; then
    mkdir -p "$ADDON_CONFIG_PATH"/moonraker/config
    cp /etc/klipper/printer.cfg "$ADDON_CONFIG_PATH"/moonraker/config/printer.cfg
fi
