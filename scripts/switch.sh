#!/bin/bash
set -e

ENV=$1

if [ "$ENV" = "blue" ]; then
    PORT=3001
elif [ "$ENV" = "green" ]; then
    PORT=3002
else
    echo "Uso: ./switch.sh {blue|green}"
    exit 1
fi

echo "Cambiando tráfico a $ENV ($PORT)..."

# IMPORTANTE: todos los sed deben llevar sudo
sudo sed -i "s/server 127.0.0.1:[0-9]*/server 127.0.0.1:$PORT/" /etc/nginx/sites-available/app.conf

# probar sintaxis
sudo nginx -t

# recargar nginx
sudo systemctl reload nginx

echo "Tráfico cambiado a $ENV"
