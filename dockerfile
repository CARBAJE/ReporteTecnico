# Usar Debian como base (generalmente más ligera)
FROM debian:bullseye-slim

# Actualizar repositorios e instalar dependencias
RUN apt-get update && apt-get install -y \
    texlive-full \
    make \
    git \
    python3-pygments \
    python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Asegurarnos que Pygments esté correctamente instalado
RUN pip3 install --upgrade pygments

# Establecer directorio de trabajo
WORKDIR /project

# Comando por defecto
CMD ["/bin/bash"]