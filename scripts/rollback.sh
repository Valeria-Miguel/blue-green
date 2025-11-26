#!/bin/bash
set -e

NGINX_CONF="/etc/nginx/sites-available/blue-green.conf"

echo "Haciendo rollback a Blue (puerto 8081)..."

sudo cp $NGINX_CONF ${NGINX_CONF}.bak
sudo sed -i "s/server 127.0.0.1:[0-9]\+/server 127.0.0.1:8081/" $NGINX_CONF

if ! sudo nginx -t; then
    echo "Error crítico en Nginx"
    exit 1
fi

sudo nginx -s reload
echo "Rollback completado a Blue"