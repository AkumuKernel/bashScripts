#!/bin/bash
set -e  # Detener si hay errores

MYSQL_VERSION="5.7.44"
BOOST_VERSION="1_59_0"
INSTALL_DIR="/opt/mysql57"
BOOST_DIR="../boost"

# 🔹 1. Instalar dependencias necesarias
echo "🔹 Instalando dependencias en Linux..."
if command -v apt &> /dev/null; then
    sudo apt update && sudo apt install -y build-essential cmake libncurses-dev libssl-dev libssl1.1 bison libaio-dev rpcsvc-proto
elif command -v pacman &> /dev/null; then
    sudo pacman -Sy --needed base-devel cmake ncurses openssl openssl-1.1 bison libaio rpcsvc-proto
elif command -v dnf &> /dev/null; then
    sudo dnf install -y cmake ncurses-devel openssl-devel bison libaio-devel rpcsvc-proto
elif command -v yum &> /dev/null; then
    sudo yum install -y cmake ncurses-devel openssl-devel bison libaio-devel rpcsvc-proto
else
    echo "❌ Gestor de paquetes no soportado"
    exit 1
fi

# 🔹 2. Descargar el código fuente de MySQL 5.7
echo "🔹 Descargando MySQL $MYSQL_VERSION..."
wget -q https://downloads.mysql.com/archives/get/p/23/file/mysql-${MYSQL_VERSION}.tar.gz
tar -xzf mysql-${MYSQL_VERSION}.tar.gz
cd mysql-${MYSQL_VERSION}

# 🔹 3. Configurar CMake con OpenSSL 1.1 y Boost 1.59.0
echo "🔹 Configurando CMake y descargando Boost $BOOST_VERSION..."
mkdir build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR \
         -DMYSQL_DATADIR=$INSTALL_DIR/data \
         -DDEFAULT_CHARSET=utf8 \
         -DDEFAULT_COLLATION=utf8_general_ci \
         -DDOWNLOAD_BOOST=1 \
         -DWITH_BOOST=$BOOST_DIR \
	 -DWITHOUT_GROUP_REPLICATION=1

# 🔹 4. Compilar e instalar MySQL
echo "🔹 Compilando MySQL... (esto puede tardar un rato)"
make -j$(nproc)
sudo make install

# 🔹 5. Configurar permisos y usuario
echo "🔹 Configurando permisos y usuario MySQL..."
sudo groupadd -f mysql
sudo useradd -r -g mysql -s /bin/false mysql || true
sudo mkdir -p $INSTALL_DIR/data
sudo chown -R mysql:mysql $INSTALL_DIR

# 🔹 6. Inicializar la base de datos
echo "🔹 Inicializando base de datos..."
sudo rm -rf $INSTALL_DIR/data
sudo mkdir -p $INSTALL_DIR/data
sudo chown -R mysql:mysql $INSTALL_DIR/data
cd $INSTALL_DIR
sudo bin/mysqld --initialize --user=mysql --basedir=$INSTALL_DIR --datadir=$INSTALL_DIR/data

# 🔹 7. Crear alias para facilidad de uso
echo "🔹 Creando alias para MySQL..."
echo "export PATH=$INSTALL_DIR/bin:\$PATH" >> ~/.zshrc
source ~/.zshrc

# 🔹 8. Mensaje final con instrucciones
echo "✅ Instalación completada. Para iniciar MySQL manualmente usa:"
echo "   $INSTALL_DIR/bin/mysqld_safe --user=mysql --datadir=$INSTALL_DIR/data --socket=$INSTALL_DIR/mysql.sock &"
echo "Para conectarte usa:"
echo "   $INSTALL_DIR/bin/mysql -u root -p --socket=$INSTALL_DIR/mysql.sock"
