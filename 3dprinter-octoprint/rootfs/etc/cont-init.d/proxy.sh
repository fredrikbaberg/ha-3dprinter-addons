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
    reverse_proxy "$(bashio::config 'reverse_proxy')" \
    | tempio \
        -template /usr/share/tempio/caddy/Caddyfile.gtpl \
        -out /etc/caddy/Caddyfile

# Make sure file is correctly formatted.
caddy fmt --overwrite /etc/caddy/Caddyfile
