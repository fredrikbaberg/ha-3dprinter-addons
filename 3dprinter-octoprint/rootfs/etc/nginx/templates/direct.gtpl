server {
    listen {{ .interface }}:{{ .port }} default_server;

    include /etc/nginx/includes/server_params.conf;
    include /etc/nginx/includes/proxy_params.conf;

    location / {
        proxy_pass http://octoprint/;
        proxy_set_header X-Forwarded-Host   $http_host;
    }
}
