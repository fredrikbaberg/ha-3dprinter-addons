#!/usr/bin/with-contenv bashio
# ==============================================================================
# Prepare proxy
# s6-overlay docs: https://github.com/just-containers/s6-overlay
# ==============================================================================

bashio::log.info "Proxy cont-init.d"

ingress_entry=$(bashio::addon.ingress_entry)
export ingress_entry=${ingress_entry}

# Make sure output folder exists.
mkdir -p /etc/nginx/http.d/

tempio \
    -conf /data/options.json \
    -template /usr/share/tempio/ingress.conf \
    -out /etc/nginx/http.d/ingress.conf
