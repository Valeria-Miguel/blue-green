

#!/bin/bash

CONF="/etc/nginx/sites-available/app.conf"

# Regresar siempre a 3001
sudo sed -i 's/server 127\.0\.0\.1:300[1-2];/server 127.0.0.1:3001;/' $CONF

# probar sintaxis
sudo nginx -t

# recargar nginx
sudo systemctl reload nginx
