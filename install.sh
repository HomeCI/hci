#!/bin/bash

HOME_CI_PATH=/home/HomeCI
CORE_PATH=$HOME_CI_PATH/core
REPO_PATH=$HOME_CI_PATH/repo
CLI_PATH=$HOME_CI_PATH/cli

HCI_PATH=$CLI_PATH
REPO="https://raw.githubusercontent.com/HomeCI/hci/main/hci.sh"
ALIAS_NAME="hci"

# Función para crear las carpetas necesarias de HomeCI
create_homeci_folders() {
  # Creamos la carpeta HomeCI si no existe
  if [ ! -d "$HOME_CI_PATH" ]; then
    echo "Creando la carpeta $HOME_CI_PATH"
    mkdir -p "$HOME_CI_PATH"
  fi

  # Creamos la carpeta core si no existe
  if [ ! -d "$CORE_PATH" ]; then
    echo "Creando la carpeta $CORE_PATH"
    mkdir -p "$CORE_PATH"
  fi

  # Creamos la carpeta repo si no existe
  if [ ! -d "$REPO_PATH" ]; then
    echo "Creando la carpeta $REPO_PATH"
    mkdir -p "$REPO_PATH"
  fi

  # Creamos la carpeta cli si no existe
  if [ ! -d "$CLI_PATH" ]; then
    echo "Creando la carpeta $CLI_PATH"
    mkdir -p "$CLI_PATH"
  fi
}

# Llamamos a la función para crear las carpetas necesarias
create_homeci_folders

# Definimos la ruta donde queremos descargar el archivo hci.sh

# Descargamos el archivo hci.sh y le damos permisos de ejecución
curl "$REPO" -o $HCI_PATH/hci.sh
chmod +x $HCI_PATH/hci.sh

# Añadimos la ruta a la variable PATH si no está ya añadida
if [[ ":$PATH:" != *":$HCI_PATH:"* ]]; then
  echo "export PATH=\$PATH:$HCI_PATH" >> ~/.bashrc
fi

# Comprobamos que no exista ya el alias
if alias "$ALIAS_NAME" >/dev/null 2>&1; then
  echo "El alias '$ALIAS_NAME' ya existe."
else
  # Creamos el alias para llamar al script hci.sh
  echo "alias $ALIAS_NAME='$HCI_PATH/hci.sh'" >> ~/.bashrc
  echo "Se ha creado el alias '$ALIAS_NAME'."
fi

# Recargamos el archivo .bashrc
source ~/.bashrc

