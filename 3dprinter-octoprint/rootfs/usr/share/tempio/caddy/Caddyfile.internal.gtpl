# WebUI through internal hostname
{{ .addon_hostname }}:5000 {
	reverse_proxy http://127.0.0.1:80 {
	}
}
