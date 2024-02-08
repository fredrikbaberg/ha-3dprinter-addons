#!/usr/bin/with-contenv bashio
# ==============================================================================
# Add-on: 3dprinter-klipper
# Configures Fluidd
# ==============================================================================

SRC_PATH=$ADDON_SRC_PATH/fluidd

if [ ! -d "$SRC_PATH" ]; then
    bashio::log "Get Fluidd source"
    mkdir -p "$SRC_PATH" && cd "$SRC_PATH" || exit
    wget -q -O fluidd.zip https://github.com/fluidd-core/fluidd/releases/download/v1.27.1/fluidd.zip
    unzip fluidd.zip
    rm fluidd.zip
else
    bashio::log "Fluidd already installed"
fi
