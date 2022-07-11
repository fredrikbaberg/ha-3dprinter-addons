server {
    listen {{ .interface }}:{{ .port }} default_server;

    location / {
        allow   172.30.32.2;
        deny    all;

        proxy_pass http://backend/;
        proxy_set_header X-Script-Name {{ .ingress_entry }};
        proxy_set_header X-Forwarded-For 172.30.32.2;
        proxy_set_header Origin 172.30.32.2;
    }
}
