# Entorno de Desarrollo C/C++ en Docker

Este proyecto proporciona un entorno de desarrollo basado en Docker para compilar y ejecutar programas en C/C++, además de contar con Python 3 instalado. El entorno está basado en Ubuntu y está configurado para utilizar un usuario no root llamado `build`.

## Índice

- [Contenido del Contenedor](#contenido-del-contenedor)
- [Requisitos Previos](#requisitos-previos)
- [Despliegue del Contenedor](#despliegue-del-contenedor)
  - [1. Clonar el Repositorio](#1-clonar-el-repositorio)
  - [2. Construir y Levantar el Contenedor](#2-construir-y-levantar-el-contenedor)
  - [3. Acceder al Contenedor](#3-acceder-al-contenedor)
  - [4. Conexión Remota desde Visual Studio Code](#4-conexión-remota-desde-visual-studio-code)
- [Notas Adicionales](#notas-adicionales)

## Contenido del Contenedor

El contenedor incluye las siguientes herramientas y configuraciones:

- **Sistema Operativo**: Ubuntu (versión más reciente).
- **Herramientas de Compilación**: `build-essential` (incluye `gcc`, `g++`, `make`).
- **Python**: Python 3 y pip.
- **Usuario no root**: `build` con permisos sudo.
- **Directorio de Trabajo**: `/home/build/workspace` (carpeta `workspace` dentro del directorio home del usuario `build`).

## Requisitos Previos

Asegúrate de tener instalados los siguientes programas en tu máquina:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [Visual Studio Code](https://code.visualstudio.com/) (opcional, para trabajar remotamente)

## Despliegue del Contenedor

### 1. Clonar el Repositorio

Clona este repositorio en tu máquina local:

```bash
git clone <URL_DEL_REPOSITORIO>
cd <NOMBRE_DEL_REPOSITORIO>
```

### 2. Construir y Levantar el Contenedor
Construye y despliega el contenedor usando Docker Compose:


```
docker-compose up -d --build
```
Este comando hará lo siguiente:

Construirá la imagen Docker basada en el Dockerfile.
Levantará el contenedor en segundo plano con el nombre ubuntu-C-C++.
Creará una carpeta workspace dentro del directorio home del usuario build en el contenedor.

### 3. Acceder al Contenedor
Para acceder al contenedor y comenzar a trabajar en el entorno:

bash
```
docker exec -it ubuntu-C-C++ /bin/bash
```

Esto te llevará directamente al directorio /home/build/workspace como el usuario build.

Comandos Útiles
Reconstruir el Contenedor:

Si realizas cambios en el Dockerfile, puedes reconstruir el contenedor usando:

```
docker-compose up -d --build
```

Detener el Contenedor:

Para detener y eliminar el contenedor:

```
docker-compose down
```

Listar Contenedores Activos:

Si quieres ver una lista de todos los contenedores activos:

```
docker ps
```

Ver los Logs del Contenedor:

Para ver los logs generados por el contenedor:

```
docker-compose logs
```

### 4. Conexión Remota desde Visual Studio Code
Puedes utilizar Visual Studio Code para editar archivos y trabajar directamente dentro del contenedor. Para hacer esto:

1. Instalar la Extensión de Docker
En Visual Studio Code, instala la extensión Docker.

2. Instalar la Extensión de Desarrollo Remoto
Instala también la extensión Remote - Containers.

3. Abrir el Proyecto en un Contenedor
Abre Visual Studio Code y carga la carpeta del proyecto (donde está el docker-compose.yml).
Haz clic en el icono de >< en la esquina inferior izquierda de Visual Studio Code.
Selecciona "Remote-Containers: Reopen in Container".
Visual Studio Code se conectará al contenedor y te permitirá trabajar en los archivos directamente en el entorno del contenedor.
4. Abrir un Terminal Dentro del Contenedor
Una vez conectado, puedes abrir un terminal que se ejecutará dentro del contenedor:

Ve a Terminal > New Terminal en Visual Studio Code.
Este terminal estará en el directorio /home/build/workspace dentro del contenedor.
Notas Adicionales
Persistencia de Datos: Todo lo que hagas dentro de la carpeta workspace se sincroniza con tu máquina local.
Usuario build: El usuario predeterminado en el contenedor es build, que tiene permisos sudo para realizar tareas administrativas.