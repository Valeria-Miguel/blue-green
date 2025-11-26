#!/bin/bash
set -e

ENVIRONMENT=$1
PORT=""
CONTAINER_NAME=""

if [ "$ENVIRONMENT" == "blue" ]; then
    PORT=8081
    CONTAINER_NAME="app-blue"
elif [ "$ENVIRONMENT" == "green" ]; then
    PORT=8082
    CONTAINER_NAME="app-green"
else
    echo "Uso: ./deploy.sh [blue|green]"
    exit 1
fi

echo "Desplegando en $ENVIRONMENT (puerto $PORT)..."

docker stop $CONTAINER_NAME 2>/dev/null || true
docker rm $CONTAINER_NAME 2>/dev/null || true

docker build -t blue-green-app:latest .

docker run -d \
    --name $CONTAINER_NAME \
    -p $PORT:3000 \
    --restart unless-stopped \
    blue-green-app:latest

echo "Despliegue en $ENVIRONMENT completado"