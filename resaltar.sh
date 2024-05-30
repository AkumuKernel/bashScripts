#!/bin/bash

# Definir función para resaltar títulos
resaltar_titulo() {
    local titulo="$1"
    echo -e "\e[1;33m$titulo\e[0m"
}

# Ruta al archivo en el directorio de inicio del usuario
archivo="$HOME/token"

# Leer el archivo línea por línea
while IFS= read -r titulo; do
    # Resaltar título
    resaltar_titulo "$titulo"
    # Leer y mostrar línea de texto
    read -r texto
    echo "$texto"
    # Mostrar espacio en blanco
    echo
    # Leer y descartar línea en blanco
    read -r _
done < "$archivo"
