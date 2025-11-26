#!/bin/bash

echo "=== ESTADO BLUE-GREEN DEPLOYMENT ==="
echo
echo "Contenedores activos:"
docker ps --filter "name=app-" --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
echo
echo "Nginx - Upstream activo:"
sudo grep "server 127.0.0.1" /etc/nginx/sites-available/app.conf | head -1
echo
echo "Health check Blue (3001):"
curl -s http://127.0.0.1:3001 || echo "No responde"
echo "Health check Green (3002):"
curl -s http://127.0.0.1:3002 || echo "No responde"
echo
echo "Servicio público:"
curl -s http://127.0.0.1/health || echo "Inactivo"