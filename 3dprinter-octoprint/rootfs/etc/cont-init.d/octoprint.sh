#!/usr/bin/with-contenv bashio
# ==============================================================================
# Prepare OctoPrint
# s6-overlay docs: https://github.com/just-containers/s6-overlay
# ==============================================================================

{ # Check if OctoPrint is installed
    octoprint --version
} || { # Otherwise install
    { # Check if Python is available
        python --version
    } || { # Otherwise install
        python3 -m venv /data/python/octoprint
    }   
    pip install octoprint==$OCTOPRINT_VERSION
}