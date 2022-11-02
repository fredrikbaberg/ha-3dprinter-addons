#!/usr/bin/with-contenv bashio
# ==============================================================================
# Add-on: 3dprinter-octoprint
# Configures proxy
# ==============================================================================

# Generate proxy configuration
bashio::var.json \
    interface "$(bashio::addon.ip_address)" \
    port "^$(bashio::addon.ingress_port)" \
    ingress_entry "$(bashio::addon.ingress_entry)" \
    camera_host "$(bashio::config 'camera_url')" \
    recovery "$(bashio::config 'recovery')" \
    reverse_proxy_test "$(bashio::config 'reverse_proxy_test')" \
    | tempio \
        -template /usr/share/tempio/Caddyfile.gtpl \
        -out /etc/caddy/Caddyfile
