:0899 {
	@ingress {
		remote_ip 172.30.32.2
	}
	handle {
		reverse_proxy @ingress 127.0.0.1:80 {
			header_up X-Script-Name {{ .ingress_entry }}
		}
	}
}
