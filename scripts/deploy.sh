#!/bin/bash
set -e
ENV=$1
PORT=3001
NAME="app-blue"
[ "$ENV" = "green" ] && PORT=3002 && NAME="app-green"

echo "Desplegando $ENV en puerto $PORT..."
docker build -t blue-green-app:latest .
docker stop $NAME 2>/dev/null || true
docker rm $NAME 2>/dev/null || true
docker run -d --name $NAME -p $PORT:3000 --restart unless-stopped blue-green-app:latest
echo "$ENV desplegado"