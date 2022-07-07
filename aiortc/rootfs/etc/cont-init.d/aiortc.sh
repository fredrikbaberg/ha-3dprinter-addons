#!/usr/bin/with-contenv bashio
# ==============================================================================
# Add-on: aiortc
# Configures aiortc configuration
# ==============================================================================

touch /data/aiortc/aiortc.conf
if bashio::config.has_value 'webrtc_arguments'; then
    bashio::config.webrtc_arguments > "/data/aiortc/aiortc.conf"
    done
fi
