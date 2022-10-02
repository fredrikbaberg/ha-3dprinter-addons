# OctoPrint WebUI
:5000 {
	reverse_proxy http://127.0.0.1:80 {
		header_up X-Scheme {scheme}
	}
}

# Camera
:8000 {
	reverse_proxy http://127.0.0.1:8080 {
		header_up X-Scheme {scheme}
	}
}

# Moonraker - expose as-is.