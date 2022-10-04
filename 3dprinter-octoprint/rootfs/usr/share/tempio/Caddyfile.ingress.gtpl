:8099 {
	@ingress {
		remote_ip 172.30.32.2
	}
	handle_path {http.request.header.X-Ingress-Path}/* {
		reverse_proxy @ingress 127.0.0.1:5000 {
			header_up X-Script-Name {http.request.header.X-Ingress-Path}/
			header_up -Origin
			header_up Origin 172.30.32.2
			header_up X-Forwarded-For 172.30.32.2
			header_up X-Scheme {scheme}
			flush_interval -1
		}
	}
}
