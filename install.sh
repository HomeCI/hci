#!/bin/bash

# Definimos la ruta donde queremos descargar el archivo hci.sh
HCI_PATH=/ruta/a/HCI
REPO="https://raw.githubusercontent.com/HomeCI/hci/main/hci.sh"

# Descargamos el archivo hci.sh y le damos permisos de ejecución
curl "$REPO" -o $HCI_PATH/hci.sh
chmod +x $HCI_PATH/hci.sh
# Añadimos la ruta a la variable PATH si no está ya añadida
if [[ ":$PATH:" != *":$HCI_PATH:"* ]]; then
  echo "export PATH=\$PATH:$HCI_PATH" >> ~/.bashrc
fi
# Recargamos el archivo .bashrc
source ~/.bashrc
