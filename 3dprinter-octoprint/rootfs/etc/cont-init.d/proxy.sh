#!/usr/bin/with-contenv bashio
# ==============================================================================
# Add-on: 3dprinter-octoprint
# Configures proxy
# ==============================================================================

# Generate proxy configuration for Ingress
bashio::var.json \
    interface "$(bashio::addon.ip_address)" \
    port "^$(bashio::addon.ingress_port)" \
    ingress_entry "$(bashio::addon.ingress_entry)" \
    camera_host "$(bashio::config 'camera_url')" \
    mode "$(bashio::config 'mode')" \
    | tempio \
        -template /usr/share/tempio/caddy/Caddyfile.ingress.gtpl \
        -out /etc/caddy/configs/ingress.caddy

# Generate proxy configuration for direct access, if enabled.
if bashio::var.has_value "$(bashio::addon.port 5000)"; then
    bashio::var.json \
        mode "$(bashio::config 'mode')" \
        | tempio \
            -template /usr/share/tempio/caddy/Caddyfile.direct.gtpl \
            -out /etc/caddy/configs/direct.caddy
fi
