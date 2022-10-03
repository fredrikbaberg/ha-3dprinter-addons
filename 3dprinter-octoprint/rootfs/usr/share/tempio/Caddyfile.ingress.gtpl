# {
# 	debug
# }
:8099 {
	@ingress {
		remote_ip 172.30.32.2
	}
	handle {
		reverse_proxy @ingress 127.0.0.1:5000 {
			# header_up X-Script-Name {{ .ingress_entry }}
			header_up X-Script-Name {http.request.header.X-Ingress-Path}
		}
	}
}
