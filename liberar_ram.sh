#!/bin/sh
# Autor: Tu nombre
# Licencia: GNU GPLv3
# Limpiar es un script para limpiar la caché y liberar memoria
sync ; echo 3 > /proc/sys/vm/drop_caches ; echo "RAM Liberada"
