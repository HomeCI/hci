#!/bin/bash
MY_DIR="tool"
source .env # Cree un fichero .env +x con las siguientes variables
#export CIP_REPO_PATH="path/to/directorio de los docker-compose"
#export CIP_CORE_PATH="path/to/directorio de los docker-compose"


# Se comprueba que la variable de directorio esté definida
if [ -z "$MY_DIR" ]; then
    echo "Error: La variable de entorno MY_DIR no está definida"
    exit 1
fi

# Se comprueba que el directorio exista
if [ ! -d "$MY_DIR" ]; then
    echo "Error: El directorio $MY_DIR no existe"
    exit 1
fi

# Se dan permisos de ejecución a todos los archivos en el directorio
chmod +x "$MY_DIR"/*

# Se ordenan los archivos de mayor a menor por tamaño
sorted_files=($(ls -S "$MY_DIR"))

# Se concatena el contenido de los archivos en un archivo de salida
output_file="hci.sh"
echo "#!/bin/bash" > $output_file
for file in "${sorted_files[@]}"
do
    if [ -x "$MY_DIR/$file" ]; then
        echo -ne "\n #--- $MY_DIR/$file --- \n" >> "$output_file"
        sed '/^#\!\/bin\/bash/d' "$MY_DIR/$file" >> "$output_file"
        
    fi
done

# Se dan permisos de ejecución al archivo de salida
chmod +x "$output_file"

# Se ejecuta el archivo de salida
./"$output_file" "$@"
