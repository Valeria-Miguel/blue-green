#!/bin/bash
ENV=$1
if [ "$ENV" = "green" ]; then
    sudo sed -i 's/server 127\.0\.0\.1:300[1-2];/server 127.0.0.1:3002;/' /etc/nginx/sites-available/app.conf
else
    sudo sed -i 's/server 127\.0\.0\.1:300[1-2];/server 127.0.0.1:3001;/' /etc/nginx/sites-available/app.conf
fi
sudo nginx -t && sudo systemctl reload nginx
echo "Tráfico cambiado a $ENV"