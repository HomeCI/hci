# Home CI command

El script cihome.sh es una herramienta de línea de comandos para controlar los contenedores Docker de los repositorios del proyecto CIP.

## Instalación


## Variables de entorno

El script utiliza las siguientes variables de entorno:

* `CIP_REPO_PATH`: Directorio raíz de los repositorios de CIP
* `CIP_CORE_PATH`: Directorio raíz de los repositorios de CIP Core

Estas variables deben estar definidas en el entorno antes de usar el script.

## Comandos

### start
Inicia el contenedor del repositorio indicado.

```makefile
Uso: cihome.sh start <nombre-repositorio>
```

Ejemplo:

```ruby
$ cihome.sh start mi_repositorio
```

### stop

Detiene el contenedor del repositorio indicado.

```vbnet
Uso: cihome.sh stop <nombre-repositorio>
```

Ejemplo:

```arduino
$ cihome.sh stop mi_repositorio
```

### build
Crea y arranca el contenedor del repositorio indicado.

```makefile
Uso: cihome.sh build <nombre-repositorio>
```

Ejemplo:

```ruby
$ cihome.sh build mi_repositorio
```

### status
Muestra el estado de todos los contenedores.

```lua
Uso: cihome.sh status
```

### logs
Muestra los logs del contenedor indicado.

```makefile
Uso: cihome.sh logs <nombre-repositorio>
```

Ejemplo:

```ruby
$ cihome.sh logs mi_repositorio
```

### exec
Abre una terminal en el contenedor indicado.

```bash
Uso: cihome.sh exec <nombre-repositorio>
```

Ejemplo:

```shell
$ cihome.sh exec mi_repositorio
``` 

### list
Lista los repositorios disponibles.

```makefile
cihome.sh list
``` 

Ejemplos de uso

```shell
$ cihome.sh start mi_repositorio
$ cihome.sh logs mi_repositorio
$ cihome.sh exec mi_repositorio
$ cihome.sh list
```

