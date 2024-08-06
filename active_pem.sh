#!/bin/bash

# Verifica que se proporcione un argumento (ruta al directorio)
if [ $# -ne 1 ]; then
    echo "Uso: $0 <ruta/al/directorio>"
    exit 1
fi

# Verifica que el argumento proporcionado sea un directorio
directory="$1"
if [ ! -d "$directory" ]; then
    echo "El argumento debe ser un directorio válido."
    exit 1
fi

# Activa la clave para poder funcionar el ssh
chmod 400 "$directory"
