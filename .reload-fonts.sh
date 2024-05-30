#!/bin/bash

# Verifica si el usuario tiene permisos de superusuario
if [ "$(id -u)" != "0" ]; then
    echo "Este script necesita permisos de superusuario para ejecutarse."
    exit 1
fi

# Recarga las fuentes
echo "Recargando las fuentes..."
fc-cache -f -v

echo "Fuentes recargadas exitosamente."
