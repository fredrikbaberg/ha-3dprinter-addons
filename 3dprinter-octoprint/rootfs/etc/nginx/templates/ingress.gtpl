server {
    listen {{ .interface }}:{{ .port }} default_server;

    # include /etc/nginx/includes/server_params.conf;
    # include /etc/nginx/includes/proxy_params.conf;

    location / {
        allow   172.30.32.2;
        deny    all;

        proxy_pass http://backend/;
        proxy_set_header Host $http_host;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Scheme $scheme;
        proxy_set_header X-Script-Name {{ .ingress_entry }};
        proxy_http_version 1.1;

        client_max_body_size 0;    

        proxy_set_header X-Forwarded-For 172.30.32.2;
        add_header Origin 172.30.32.2;

        # Required when mixing http and https?
        add_header Access-Control-Allow-Origin *;
    }
}
