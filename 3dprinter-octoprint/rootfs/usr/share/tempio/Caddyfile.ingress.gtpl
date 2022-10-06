:8099 {
	@ingress {
		remote_ip 172.30.32.2
	}
	uri strip_prefix {{ .ingress_entry }}
	handle {
		reverse_proxy @ingress 127.0.0.1:5000 {
			header_up X-Script-Name {{ .ingress_entry }}
			header_up -Origin
			header_up Origin 172.30.32.2
			header_up X-Forwarded-For 172.30.32.2
			header_up X-Scheme {scheme}
			flush_interval -1
		}
	}
}
