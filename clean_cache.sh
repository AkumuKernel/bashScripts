#!/bin/bash

# Sincronizar datos con el disco
sudo sync

# Limpiar caché de memoria
sudo sysctl -w vm.drop_caches=3

echo "La memoria caché ha sido limpiada."
