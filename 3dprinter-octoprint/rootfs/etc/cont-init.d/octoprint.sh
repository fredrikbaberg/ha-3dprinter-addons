#!/usr/bin/with-contenv bashio
# ==============================================================================
# Prepare OctoPrint
# s6-overlay docs: https://github.com/just-containers/s6-overlay
# ==============================================================================

{ # Check if OctoPrint is installed.
    octoprint -b /data/config/octoprint --version
} || { # Otherwise install it.
    { # Check if Python is available (at `/data/python/octoprint` according to PATH)
        python --version
    } || { # Otherwise create Python virtual environment.
        python3 -m venv /data/python/octoprint
        # Install wheel to speed up future installs.
        pip install wheel
    }
    pip install octoprint==$OCTOPRINT_VERSION
}

# Copy OctoPrint config to persistent storage, if missing.
if [ ! -f /data/config/octoprint/config.yaml ]; then
    if [ -f /root/config/octoprint/config.yaml ]; then
        mkdir -p /data/config/octoprint
        cp /root/config/octoprint/config.yaml /data/config/octoprint/config.yaml
        bashio::log.notice "Default OctoPrint config copied"
    else
        bashio::log.warning "Default OctoPrint config not found"
    fi
fi

{ # Make sure Ingress user for OctoPrint exists.
    bashio::log.notice "Ensure Ingress user (homeassistant) exist."
    if ! octoprint --basedir /data/config/octoprint user list | grep -q 'homeassistant'; then
        new_password=$(date +%s | sha256sum | base64 | head -c 32 ; echo)
        new_password=homeassistant
        octoprint --basedir /data/config/octoprint user add --password "$new_password" --admin homeassistant # 2> /dev/null
    fi
} || { # catch
    bashio::log.warning "Failed to ensure Ingress user exists, may not be able to launch."
}
