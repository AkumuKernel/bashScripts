#!/bin/bash

# Instalación de paquetes requeridos por pacman
sudo pacman -Syyu bat lsd vim shred wget curl nano jdk8-openjdk jdk11-openjdk jdk17-openjdk jdk-openjdk groovy texstudio texlive eza chafa lesspipe fzf fastfetch graphviz nerd-fonts logrotate ttf-baekmuk --noconfirm

## Creación de carpetas
mkdir $HOME/app
mkdir $HOME/app/jvm
mkdir $HOME/app/grails

## Instalación vía git
# Autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Autocompletions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions

# Syntax Highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# History Substring Search
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

# Power Level 10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Instalar con wget
# Zulu 8
wget https://cdn.azul.com/zulu/bin/zulu8.78.0.19-ca-jdk8.0.412-linux_x64.tar.gz
tar -zxvf zulu8.78.0.19-ca-jdk8.0.412-linux_x64.tar.gz
mv zulu8.78.0.19-ca-jdk8.0.412-linux_x64 zulu-8-openjdk && mv zulu-8-openjdk/ ~/app/jvm/

# Zulu 11
wget https://cdn.azul.com/zulu/bin/zulu11.72.19-ca-jdk11.0.23-linux_x64.tar.gz
tar -zxvf zulu11.72.19-ca-jdk11.0.23-linux_x64.tar.gz
mv zulu11.72.19-ca-jdk11.0.23-linux_x64.tar.gz zulu-11-openjdk && mv zulu-11-openjdk/ ~/app/jvm/

# Grails 2.5.5
wget -P $HOME/app/grails/ https://github.com/grails/grails-core/releases/download/v2.5.5/grails-2.5.5.zip
unzip $HOME/app/grails/grails-2.5.5.zip

# Grails 3.3.11
wget -P $HOME/app/grails/ https://github.com/grails/grails-core/releases/download/v3.3.11/grails-3.3.11.zip
unzip $HOME/app/grails/grails-3.3.11.zip

# Grails 4.0.10
wget -P $HOME/app/grails/ https://github.com/grails/grails-core/releases/download/v4.0.10/grails-4.0.10.zip
unzip $HOME/app/grails/grails-4.0.10.zip

# Grails 5.2.4
wget -P $HOME/app/grails/ https://github.com/grails/grails-core/releases/download/v5.2.5/grails-5.2.5.zip
unzip $HOME/app/grails/grails-5.2.5.zip

# Grails 6.2.0
wget -P $HOME/app/grails/ https://github.com/grails/grails-core/releases/download/v6.2.0/grails-6.2.0.zip
unzip $HOME/app/grails/grails-6.2.0.zip

rm -f '$HOME/app/grails/grails-\*\.zip'

# XulRunner
wget http://ftp.mozilla.org/pub/mozilla.org/xulrunner/nightly/2010/12/2010-12-01-03-mozilla-1.9.2/xulrunner-1.9.2.13.en-US.linux-x86_64.tar.bz2
tar -zxvf xulrunner-1.9.2.13.en-US.linux-x86_64.tar.bz2 -C /opt/

## EXTRA
# Añadir sugerencias
#   plugins=( 
#       zsh-autosuggestions
#   )

# Añadir Predicciónes
#  fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

# Añadir Highlight
#  source ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Añadir busqueda del historial
#  plugins=(zsh-history-substring-search)

# Añadir powerlevel10k
# ZSH_THEME="powerlevel10k/powerlevel10k"

## Descargas manuales
echo "OpenJDK 7: https://www.oracle.com/java/technologies/javase/javase7-archive-downloads.html"
echo "MatLab: https://la.mathworks.com/products/matlab.html"
