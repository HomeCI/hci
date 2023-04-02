# Home CI command

El script hci es una herramienta de línea de comandos para controlar los contenedores Docker de los repositorios del proyecto CIP.

## Instalación

```bash
curl https://raw.githubusercontent.com/HomeCI/hci/main/install.sh -o /tmp/install.sh
chmod +x /tmp/install.sh
/tmp/install.sh
source ~/.bashrc
```

## Variables de entorno

El script utiliza las siguientes variables de entorno:

* `CIP_REPO_PATH`: Directorio raíz de los repositorios de CIP
* `CIP_CORE_PATH`: Directorio raíz de los repositorios de CIP Core

Estas variables deben estar definidas en el entorno antes de usar el script.

## Comandos

### start
Inicia el contenedor del repositorio indicado.

```makefile
Uso: hci start <nombre-repositorio>
```

Ejemplo:

```ruby
$ hci start mi_repositorio
```

### stop

Detiene el contenedor del repositorio indicado.

```vbnet
Uso: hci stop <nombre-repositorio>
```

Ejemplo:

```arduino
$ hci stop mi_repositorio
```

### build
Crea y arranca el contenedor del repositorio indicado.

```makefile
Uso: hci build <nombre-repositorio>
```

Ejemplo:

```ruby
$ hci build mi_repositorio
```

### status
Muestra el estado de todos los contenedores.

```lua
Uso: hci status
```

### logs
Muestra los logs del contenedor indicado.

```makefile
Uso: hci logs <nombre-repositorio>
```

Ejemplo:

```ruby
$ hci logs mi_repositorio
```

### exec
Abre una terminal en el contenedor indicado.

```bash
Uso: hci exec <nombre-repositorio>
```

Ejemplo:

```shell
$ hci exec mi_repositorio
``` 

### list
Lista los repositorios disponibles.

```makefile
hci list
``` 

Ejemplos de uso

```shell
$ hci start mi_repositorio
$ hci logs mi_repositorio
$ hci exec mi_repositorio
$ hci list
```

# Desarrollo

Los scripts se encuentran en la carpeta tool. Para desarrollo modifíquelos y emplee `./compile.sh`.
Este generará un nuevo script `hci.sh` como resultado de la unificación de los scripts presentes bajo la carpeta `tool`.