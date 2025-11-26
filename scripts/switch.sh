#!/bin/bash
set -e

ENVIRONMENT=$1
NGINX_CONF="/etc/nginx/sites-available/blue-green.conf"
PORT=""

if [ "$ENVIRONMENT" == "blue" ]; then
    PORT=8081
elif [ "$ENVIRONMENT" == "green" ]; then
    PORT=8082
else
    echo "Uso: ./switch.sh [blue|green]"
    exit 1
fi

echo "Cambiando tráfico a $ENVIRONMENT (puerto $PORT)..."

sudo cp $NGINX_CONF ${NGINX_CONF}.bak

sudo sed -i "s/server 127.0.0.1:[0-9]\+/server 127.0.0.1:$PORT/" $NGINX_CONF

if ! sudo nginx -t; then
    echo "Error en configuración Nginx, revirtiendo..."
    sudo cp ${NGINX_CONF}.bak $NGINX_CONF
    exit 1
fi

sudo nginx -s reload
echo "Tráfico cambiado a $ENVIRONMENT (puerto $PORT)"