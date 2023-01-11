#!/usr/bin/with-contenv bashio
# ==============================================================================
# Add-on: aiortc
# Configures NGINX for use with aiortc
# ==============================================================================

# Generate Ingress configuration
bashio::var.json \
    interface "$(bashio::addon.ip_address)" \
    port "^$(bashio::addon.ingress_port)" \
    | tempio \
        -template /etc/nginx/templates/ingress.gtpl \
        -out /etc/nginx/servers/ingress.conf
