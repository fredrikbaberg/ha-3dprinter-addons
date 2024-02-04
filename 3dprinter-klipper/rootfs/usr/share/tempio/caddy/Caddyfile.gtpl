# Will be exposed by default.
# :7125 {
# 	reverse_proxy http://127.0.0.1:7125
# }

# Ingress
:8099 {
	reverse_proxy http://127.0.0.1:7125
}
