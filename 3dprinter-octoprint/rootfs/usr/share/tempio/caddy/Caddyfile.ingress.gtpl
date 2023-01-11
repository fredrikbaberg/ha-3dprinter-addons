{
	debug
	log {
		format console
		output file /var/log/caddy/caddy.log
	}
}

:8099 {
	@ingress {
		remote_ip 172.30.32.2
	}
	uri strip_prefix {{ .ingress_entry }}

	handle_path /camera/* {
		reverse_proxy @ingress {{ .camera_host }} {
		}
	}
	handle {
		{{ if eq .mode "camera" }}
		reverse_proxy @ingress {{ .camera_host }} {
			trusted_proxies 172.30.32.2
		}
		{{ else if eq .mode "recovery" }}
		rewrite / /recovery
		{{ else if eq .mode "reverse_proxy_test" }}
		rewrite / /reverse_proxy_test
		{{ end }}
		reverse_proxy @ingress 127.0.0.1:80 {
			header_up X-Script-Name {{ .ingress_entry }}
			trusted_proxies 172.30.32.2
			# header_up -Origin
			# header_up Origin 172.30.32.2
			# header_up X-Forwarded-For 172.30.32.2
			# header_up X-Scheme {scheme}
			# flush_interval -1
		}
	}
}

# OctoPrint WebUI
:5000 {
	reverse_proxy http://127.0.0.1:80 {
		{{ if .trusted_proxies }}
		trusted_proxies {{ .trusted_proxies }}
		{{ end }}
	}
}