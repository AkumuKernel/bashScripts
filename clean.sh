#!/bin/bash

# Limpiar la caché de pacman
echo "Limpiando la caché de pacman..."
sudo pacman -Scc --noconfirm

# Limpiar los paquetes órfanos
echo "Eliminando paquetes órfanos..."
orphans=$(pacman -Qdtq)
if [ -n "$orphans" ]; then
    sudo pacman -Rns --noconfirm $orphans
else
    echo "No se encontraron paquetes órfanos."
fi

# Limpiar la caché de yay (AUR Helper)
echo "Limpiando la caché de yay..."
yay -Sc --noconfirm

# Limpiar archivos temporales en /tmp
echo "Limpiando archivos temporales en /tmp..."
sudo rm -rf /tmp/*

# Limpiar archivos temporales en el directorio de caché del usuario
echo "Limpiando archivos temporales en el directorio de caché del usuario..."
rm -rf ~/.cache/*

# Limpiar archivos de registro
echo "Rotando y limpiando archivos de registro..."
sudo logrotate -f /etc/logrotate.conf

echo "Limpieza completada."
