#!/bin/bash

# Obtener la resolución de la pantalla
resolution=$(xdpyinfo | grep dimensions | awk '{print $2}')
width=$(echo $resolution | cut -d 'x' -f 1)

# Determinar el tamaño de la fuente basado en la resolución
if [ $width -ge 3840 ]; then
    font_size=14
elif [ $width -ge 2560 ]; then
    font_size=12
elif [ $width -ge 1920 ]; then
    font_size=10
else
    font_size=12
fi

# Modificar el archivo kitty.conf con el nuevo tamaño de fuente
config_file="$HOME/.config/kitty/kitty.conf"
sed -i "s/^font_size.*/font_size $font_size/" "$config_file"

# Recargar la configuración de Kitty
kitty @ set-font-size --all $font_size
