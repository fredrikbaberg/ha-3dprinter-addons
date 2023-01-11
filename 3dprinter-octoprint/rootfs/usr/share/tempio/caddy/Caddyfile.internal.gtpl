# Internal access, e.g. for Home-Assistant OctoPrint integration.
:5000 {
	bind {{ .addon_ip }}
	reverse_proxy http://127.0.0.1:80 {
	}
}
