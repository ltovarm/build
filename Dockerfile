# Usar la imagen base de Ubuntu
FROM ubuntu:latest

# Actualizar el sistema e instalar herramientas de compilación
RUN apt-get update && apt-get install -y \
    build-essential \
    python3 \
    python3-pip \
    && apt-get clean

# Verificar si el usuario 'build' existe, si no, crearlo
RUN id -u build &>/dev/null || useradd -m -s /bin/bash build && echo "build:1234" | chpasswd && adduser build sudo

# Establecer el directorio de trabajo
WORKDIR /home/build

# Crear la carpeta 'workspace' en el home del usuario 'build'
RUN mkdir -p /home/build/workspace && chown build:build /home/build/workspace

# Comando para mantener el contenedor corriendo
CMD ["/bin/bash"]
