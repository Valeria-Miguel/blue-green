#!/bin/bash
ENV=$1

CONF="/etc/nginx/sites-available/app.conf"

if [ "$ENV" = "green" ]; then
    # Apunta a 3002
    sed -i 's/server 127\.0\.0\.1:300[1-2];/server 127.0.0.1:3002;/' $CONF
else
    # Apunta a 3001
    sed -i 's/server 127\.0\.0\.1:300[1-2];/server 127.0.0.1:3001;/' $CONF
fi

nginx -t && systemctl reload nginx

echo "Tráfico cambiado a $ENV"
