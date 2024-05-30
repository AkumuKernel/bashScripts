#! /bin/sh

# Obtener la lista de paquetes instalados y disponibles en los repositorios
packages=$(comm -12 <(pacman -Slq | sort) <(pacman -Qq | sort))

# Instalar los paquetes utilizando xargs y pacman
echo "$packages" | xargs -r sudo pacman -S --noconfirm
