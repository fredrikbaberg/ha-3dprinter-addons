server {
    listen {{ .interface }}:{{ .port }} default_server;
    server_name $hostname;

    location / {
        allow   172.30.32.2;
        deny    all;

        proxy_pass http://octoprint/;
        proxy_set_header Host               $http_host;
        proxy_set_header Upgrade            $http_upgrade;
        proxy_set_header Connection         "upgrade";
        proxy_set_header X-Real-IP          $remote_addr;
        proxy_set_header X-Forwarded-For    $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Host   $http_host;
        proxy_set_header X-Scheme           $scheme;
        proxy_set_header X-Script-Name      {{ .ingress_entry }};
        proxy_http_version                  1.1;
        client_max_body_size                0;
    }

    location /webcam/ {
        proxy_pass {{ .camera_host }};
    }

    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   html;
    }
}

# The following headers/settings are currently not used.
# proxy_set_header X-Forwarded-For    172.30.32.2; # Autologin since using Home Assistant Ingress.
# proxy_set_header X-Forwarded-Server $host;
# proxy_set_header X-Forwarded-Port   $port;
