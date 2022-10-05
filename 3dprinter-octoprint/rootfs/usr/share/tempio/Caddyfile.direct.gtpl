# OctoPrint WebUI
:5000 {
	reverse_proxy http://127.0.0.1:80 {
		header_up X-Scheme {scheme}
	}
}
