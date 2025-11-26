#!/bin/bash

CONF="/etc/nginx/sites-available/app.conf"

# Regresar siempre a 3001
sed -i 's/server 127\.0\.0\.1:300[1-2];/server 127.0.0.1:3001;/' $CONF

nginx -t && systemctl reload nginx

echo "Rollback a Blue (3001)"
