#!/usr/bin/with-contenv bashio
# ==============================================================================
# Add-on: 3dprinter-octoprint
# Configures proxy
# ==============================================================================

# Generate proxy configuration for access by Ingress
# bashio::var.json \
#     addon_hostname "$(bashio::addon.hostname)" \
#     addon_ip "$(bashio::addon.ip_address)" \
#     camera_host "$(bashio::config 'camera_url')" \
#     ingress_entry "$(bashio::addon.ingress_entry)" \
#     ingress_port "^$(bashio::addon.ingress_port)" \
#     interface "$(bashio::addon.ip_address)" \
#     mode "$(bashio::config 'mode')" \
#     supervisor_ip "$(bashio::supervisor.ip_address)" \
#     trusted_proxies "$(bashio::config 'trusted_proxies')" \
#     | tempio \
#         -template /usr/share/tempio/caddy/Caddyfile.ingress.gtpl \
#         -out /etc/caddy/sites-enabled/ingress.caddy

# Generate proxy configuration for any access
# tempio \
#     -template /usr/share/tempio/caddy/Caddyfile.any.gtpl \
#     -out /etc/caddy/sites-enabled/any.caddy

# # Generate proxy configuration for internal access
# bashio::var.json \
#     addon_hostname "$(bashio::addon.hostname)" \
#     | tempio \
#         -template /usr/share/tempio/caddy/Caddyfile.internal.gtpl \
#         -out /etc/caddy/sites-enabled/internal.caddy

# Make sure file is correctly formatted.
# caddy fmt --overwrite /etc/caddy/Caddyfile