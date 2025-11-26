#!/bin/bash

echo "=== ESTADO BLUE-GREEN DEPLOYMENT ==="
echo
echo "Contenedores activos:"
docker ps --filter "name=app-" --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
echo
echo "Nginx - Upstream activo:"
sudo grep "server 127.0.0.1" /etc/nginx/sites-available/blue-green.conf | head -1
echo
echo "Health check Blue (8081):"
curl -s http://127.0.0.1:8081 || echo "No responde"
echo "Health check Green (8082):"
curl -s http://127.0.0.1:8082 || echo "No responde"
echo
echo "Servicio público:"
curl -s http://127.0.0.1/health || echo "Inactivo"