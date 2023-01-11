# OctoPrint WebUI through any access
:5000 {
	reverse_proxy http://127.0.0.1:5000 {
	}
}
