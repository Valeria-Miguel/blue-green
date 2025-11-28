#!/bin/bash
set -e

# Parámetro: "blue" o "green"
ENV=$1

# Definimos puerto y nombre del contenedor según el entorno
PORT=3001
NAME="app-blue"
if [ "$ENV" = "green" ]; then
  PORT=3002
  NAME="app-green"
fi

echo "=== DESPLEGANDO $ENV EN PUERTO $PORT ==="

# Construir la imagen Docker sin cache para asegurar que se tomen todos los cambios
docker build --no-cache -t blue-green-app:latest .

#  Detener y eliminar contenedor anterior si existe
docker stop $NAME 2>/dev/null || true
docker rm $NAME 2>/dev/null || true

# Levantar el contenedor nuevo
docker run -d \
  --name $NAME \
  -p $PORT:3000 \
  --restart unless-stopped \
  blue-green-app:latest

echo "=== $ENV DESPLEGADO CORRECTAMENTE ==="
