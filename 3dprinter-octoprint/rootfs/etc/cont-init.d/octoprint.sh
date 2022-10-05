#!/usr/bin/with-contenv bashio
# ==============================================================================
# Prepare OctoPrint
# s6-overlay docs: https://github.com/just-containers/s6-overlay
# ==============================================================================

{ # Check if OctoPrint is installed.
    octoprint --version
} || { # Otherwise install it.
    { # Check if Python is available (at `/data/python/octoprint` according to PATH)
        python --version
    } || { # Otherwise create Python virtual environment.
        python3 -m venv /data/python/octoprint
        # Install wheel to speed up future installs.
        pip install wheel
    }
    pip install octoprint==$OCTOPRINT_VERSION
    # Temporary bugfix, to be removed after 1.8.5 is released.
    sed -i 's+//,+//g,+g' /data/python/octoprint/lib/python3.9/site-packages/octoprint/static/js/app/client/base.js 
}

# Copy OctoPrint config to persistent storage, if missing.
if [ ! -f /data/config/octoprint/config.yaml ]; then
    if [ -f /root/config/octoprint/config.yaml ]; then
        mkdir -p /data/config/octoprint
        # cp /root/config/octoprint/config.yaml /data/config/octoprint/config.yaml
        bashio::log.notice "Default OctoPrint config copied"
    else
        bashio::log.warning "Default OctoPrint config not found"
    fi
fi

# TODO: Check if user exists before setting password.
# { # Make sure Ingress user for OctoPrint exists.
#     bashio::log.notice "Ensure Ingress user (homeassistant) exist."
#     new_password=$(date +%s | sha256sum | base64 | head -c 32 ; echo)
#     octoprint --basedir /data/config/octoprint user add homeassistant --password "$new_password" --group users --group admins # 2> /dev/null
# } || { # catch
#     bashio::log.warning "Failed to ensure Ingress user exists, may not be able to launch."
# }
