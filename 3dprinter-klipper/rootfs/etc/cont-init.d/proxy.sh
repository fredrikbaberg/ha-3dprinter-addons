#!/usr/bin/with-contenv bashio
# ==============================================================================
# Add-on: 3dprinter-octoprint
# Configures proxy
# ==============================================================================

# Generate proxy configuration
bashio::var.json \
    addon_hostname "$(bashio::addon.hostname)" \
    addon_ip "$(bashio::addon.ip_address)" \
    trusted_proxies "$(bashio::config 'trusted_proxies')" \
    camera_url "$(bashio::config 'camera_url')" \
    ingress_port "^$(bashio::addon.ingress_port)" \
    fluidd_src "$ADDON_SRC_PATH/fluidd" \
    mainsail_src "$ADDON_SRC_PATH/mainsail" \
    | tempio \
        -template /usr/share/tempio/caddy/Caddyfile.gtpl \
        -out /etc/caddy/sites-enabled/moonraker.caddy

# Make sure config is correctly formatted.
caddy fmt --overwrite /etc/caddy/Caddyfile
