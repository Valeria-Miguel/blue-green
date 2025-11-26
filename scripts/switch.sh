#!/bin/bash
ENV=$1
PORT=8081
[ "$ENV" = "green" ] && PORT=8082

echo "Cambiando tráfico a $ENV (puerto $PORT)..."
sudo sed -i "s/server 127\.0\.0\.1:[0-9]\+/server 127.0.0.1:$PORT/" /etc/nginx/sites-available/blue-green.conf
sudo nginx -t && sudo systemctl reload nginx && echo "TRÁFICO CAMBIADO A $ENV"
EOF

cat > scripts/rollback.sh << 'EOF'
#!/bin/bash
echo "Rollback a Blue..."
sudo sed -i "s/server 127\.0\.0\.1:[0-9]\+/server 127.0.0.1:8081/" /etc/nginx/sites-available/blue-green.conf
sudo nginx -t && sudo systemctl reload nginx && echo "Rollback completado"