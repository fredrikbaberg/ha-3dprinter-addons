#!/usr/bin/with-contenv bashio
# ==============================================================================
# Prepare OctoPrint
# s6-overlay docs: https://github.com/just-containers/s6-overlay
# ==============================================================================

whoami

{ # Check if OctoPrint is installed
    bashio::log.info "Check OctoPrint version..."
    octoprint --version
} || { # Otherwise install
    { # Check if Python is available
        bashio::log.info "Check Python version..."
        python --version
    } || { # Otherwise install
        bashio::log.info "Install Python..."
        python3 -m venv /data/python/octoprint
    }
    bashio::log.info "Install OctoPrint..."
    pip install octoprint==$OCTOPRINT_VERSION
}