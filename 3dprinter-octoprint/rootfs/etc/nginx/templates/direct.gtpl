server {
    listen {{ .interface }}:{{ .port }} default_server;

    location / {
        proxy_pass http://backend/;
    }
}
