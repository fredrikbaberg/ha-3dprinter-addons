server {
    listen {{ .interface }}:{{ .port }} default_server;

    # include /etc/nginx/includes/server_params.conf;
    # include /etc/nginx/includes/proxy_params.conf;

    location / {
        proxy_pass http://octoprint/;
        proxy_set_header Host $http_host;
        # proxy_set_header Upgrade $http_upgrade;
        # proxy_set_header Connection "upgrade";
        # proxy_set_header X-Real-IP $remote_addr;
        # proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        # proxy_set_header X-Scheme $scheme;
        proxy_http_version 1.1;
        
        client_max_body_size 0; 
    }

    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   html;
    }
}
