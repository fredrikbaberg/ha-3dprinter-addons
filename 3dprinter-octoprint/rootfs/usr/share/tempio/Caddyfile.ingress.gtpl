:{{ .port }} {
	@ingress {
		remote_ip {{ .interface }}
	}
	handle {
		reverse_proxy @ingress 127.0.0.1:80 {
			header_up X-Script-Name {{ .ingress_entry }}
			# header_up -Origin
			# header_up Origin 172.30.32.2
			# header_up X-Forwarded-For 172.30.32.2
			# flush_interval -1
		}
	}
}
