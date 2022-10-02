#!/usr/bin/with-contenv bashio
# ==============================================================================
# Add-on: 3dprinter-octoprint
# Configures proxy
# ==============================================================================

mkdir -p /etc/caddy/configs

# Generate Ingress configuration
bashio::var.json \
    interface "$(bashio::addon.ip_address)" \
    port "^$(bashio::addon.ingress_port)" \
    ingress_entry "$(bashio::addon.ingress_entry)" \
    camera_host "$(bashio::config 'camera_url')" \
    | tempio \
        -template /usr/share/tempio/Caddyfile.ingress.gtpl \
        -out /etc/caddy/configs/ingress.caddy

# Generate direct access configuration, if enabled.
if bashio::var.has_value "$(bashio::addon.port 5000)"; then
    bashio::var.json \
        interface "$(bashio::addon.ip_address)" \
        port "^$(bashio::addon.port 5000)" \
        | tempio \
            -template /usr/share/tempio/Caddyfile.direct.gtpl \
            -out /etc/caddy/configs/direct.caddy
fi
