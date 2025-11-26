#!/bin/bash
sudo sed -i 's/server 127\.0\.0\.1:300[1-2];/server 127.0.0.1:3001;/' /etc/nginx/sites-available/app.conf
sudo nginx -t && sudo systemctl reload nginx
echo "Rollback a Blue"