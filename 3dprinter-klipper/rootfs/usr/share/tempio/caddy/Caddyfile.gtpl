(fluidd) {
	root * {{ .fluidd_src }}
	file_server
}

# Ingress
:8099 {
	handle /websocket* {
		reverse_proxy http://127.0.0.1:7125
	}
	import fluidd
}
# Fluidd
:7130 {
	import fluidd
}
