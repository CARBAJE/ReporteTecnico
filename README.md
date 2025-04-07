# Modelo para representar comportamientos gravitacionales con dos cuerpos

Este repositorio contiene un proyecto de LaTeX para un trabajo terminal de la Escuela Superior de Cómputo (ESCOM) del Instituto Politécnico Nacional (IPN).

## Requisitos

Para compilar este documento se requiere:

- Docker (recomendado, especialmente para usuarios de Windows)
- O una instalación completa de TeXLive con los siguientes paquetes:
  - texlive-full
  - python3-pygments (necesario para el paquete `minted`)

## Uso con Docker (Recomendado)

Hemos incluido un Dockerfile para crear un entorno de compilación consistente, lo que evita problemas de compatibilidad, especialmente en Windows.

### Construcción de la imagen Docker

1. Clona este repositorio:
   ```bash
   git clone https://github.com/tu-usuario/tu-repositorio.git
   cd tu-repositorio
   ```

2. Construye la imagen Docker:
   ```bash
   docker build -t latex-environment .
   ```

### Uso de la imagen Docker

Para usuarios de Windows, ejecuta el siguiente comando desde PowerShell en el directorio del proyecto:

```powershell
docker run -it -v "${PWD}:/project" latex-environment
```

Si tienes problemas con la ruta en PowerShell, usa la ruta completa:

```powershell
docker run -it -v "C:\ruta\completa\a\tu\proyecto:/project" latex-environment
```

### Compilación del documento LaTeX

Una vez dentro del contenedor Docker, ejecuta la siguiente secuencia para compilar correctamente el documento LaTeX con referencias bibliográficas:

```bash
# Primera compilación
pdflatex -shell-escape main.tex

# Procesar referencias bibliográficas
biber main

# Segunda compilación para incorporar referencias
pdflatex -shell-escape main.tex

# Tercera compilación para resolver referencias cruzadas
pdflatex -shell-escape main.tex
```

El archivo PDF resultante (`main.pdf`) estará disponible en tu directorio del proyecto en Windows, ya que el directorio está montado como un volumen en el contenedor.

### Detener el contenedor Docker

Para salir del contenedor, simplemente escribe:

```bash
exit
```

## Estructura del proyecto

```
├── Appendices/             # Apéndices del documento
├── chapters/               # Capítulos principales
├── frontmatter/            # Material preliminar (resumen, agradecimientos, etc.)
├── img/                    # Imágenes y figuras
├── main.tex                # Documento principal
├── ipn.cls                 # Clase LaTeX personalizada para formato IPN
├── ipnstyle.sty            # Estilos adicionales
├── references.bib          # Referencias bibliográficas
└── dockerfile              # Configuración para el entorno Docker
```

## Notas importantes

- El paquete `minted` requiere la opción `-shell-escape` al compilar con pdflatex
- El documento utiliza `biblatex` con `biber` como backend para las referencias
- Si trabajas en un sistema que no es Windows, puedes instalar los paquetes necesarios directamente y compilar sin Docker

## Solución de problemas comunes

### Error con pygmentize
Si obtienes el error `Package minted Error: You must have 'pygmentize' installed to use this package`, asegúrate de estar utilizando el contenedor Docker que ya tiene pygmentize instalado.

### Referencias no resueltas
Si ves `[??]` en lugar de referencias o "undefined references", asegúrate de ejecutar la secuencia completa de compilación (pdflatex → biber → pdflatex → pdflatex).

### Problemas con rutas en Windows
Si Docker no puede acceder a tu directorio, intenta usar barras diagonales normales en la ruta o escapa las barras inversas: `C:/Users/nombre/proyecto` o `C:\\Users\\nombre\\proyecto`.