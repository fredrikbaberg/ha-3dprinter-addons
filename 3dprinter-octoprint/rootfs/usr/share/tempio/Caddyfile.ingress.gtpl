:8099 {
	@ingress {
		remote_ip 172.30.32.2
	}
	uri strip_prefix {{ .ingress_entry }}
	handle {
		reverse_proxy @ingress 127.0.0.1:5000 {
			header_up X-Script-Name {{ .ingress_entry }}/
			header_up X-Scheme {scheme}
		}
	}
}
