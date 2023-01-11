# Internal and external access. Used for:
# * Home-Assistant OctoPrint integration.
# * Accessing OctoPrint WebUI through external port.
:5000 {
	reverse_proxy http://127.0.0.1:80 {
		trusted_proxies {{ .trusted_proxies }}
	}
}
