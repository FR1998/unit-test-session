upstream django_server {
    server django:8000;
}

server {
    listen 80;
    server_name example.org;

    location /.well-known/acme-challenge/ {
        root /var/www/certbot;
    }

    location / {
	return 301 https://$host$request_uri;
    }
}

server {
    listen 443 ssl;
    server_name example.org;

    location / {
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_redirect off;
        proxy_pass http://django_server;
    }

    ssl_certificate /etc/letsencrypt/live/example.org/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/example.org/privkey.pem;

    include /etc/letsencrypt/options-ssl-nginx.conf;
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;

    location /static/ {
        alias /code/static/;
    }

    location /media/ {
        alias /code/media/;
    }
}
