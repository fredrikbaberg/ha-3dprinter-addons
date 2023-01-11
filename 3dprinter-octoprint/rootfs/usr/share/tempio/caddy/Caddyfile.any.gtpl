# OctoPrint WebUI through external access
:5000 {
	reverse_proxy http://127.0.0.1:80 {
	}
}
