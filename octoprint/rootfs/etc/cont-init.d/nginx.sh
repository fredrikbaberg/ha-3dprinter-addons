#!/usr/bin/with-contenv bashio
# ==============================================================================
# Prepare nginx proxy
# s6-overlay docs: https://github.com/just-containers/s6-overlay
# ==============================================================================

bashio::log.info "nginx cont-init.d"

ingress_entry=$(bashio::addon.ingress_entry)
export ingress_entry=${ingress_entry}

tempio \
    -conf /data/options.json \
    -template /usr/share/tempio/ingress.conf \
    -out /etc/nginx/sites-enabled/ingress.conf

tempio \
    -conf /data/options.json \
    -template /usr/share/tempio/webui.conf \
    -out /etc/nginx/sites-enabled/webui.conf
