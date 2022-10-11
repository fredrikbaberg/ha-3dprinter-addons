#!/usr/bin/with-contenv bashio
# ==============================================================================
# Add-on: 3dprinter-octoprint
# Configures proxy
# ==============================================================================

# Generate proxy configuration
bashio::var.json \
    interface "$(bashio::addon.ip_address)" \
    port "^$(bashio::addon.ingress_port)" \
    external_port "^$(bashio::addon.port 5000)" \
    ingress_entry "$(bashio::addon.ingress_entry)" \
    camera_host "$(bashio::config 'camera_url')" \
    | tempio \
        -template /usr/share/tempio/Caddyfile.gtpl \
        -out /etc/caddy/Caddyfile
