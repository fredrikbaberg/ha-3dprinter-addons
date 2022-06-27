#!/usr/bin/with-contenv bashio
# ==============================================================================
# Prepare proxy
# s6-overlay docs: https://github.com/just-containers/s6-overlay
# ==============================================================================

bashio::log.info "Proxy cont-init.d"

ingress_entry=$(bashio::addon.ingress_entry)
export ingress_entry=${ingress_entry}

tempio \
    -conf /data/options.json \
    -template /usr/share/tempio/ingress.cfg \
    -out /etc/haproxy/haproxy.cfg
