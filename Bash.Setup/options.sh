# =============================================================================
# OPCIONES DE LA SHELL (options.sh)
# =============================================================================
# Configura el comportamiento interno de ZSH mediante 'setopt' y 'zstyle'.

# -----------------------------------------------------------------------------
# NAVEGACIÓN Y ERRORES
# -----------------------------------------------------------------------------

# CORRECT: Intenta corregir pequeños errores tipográficos en los comandos.
# Ej: 'cd Dcouments' -> te lleva a 'Documents'.
setopt CORRECT

# AUTO_CD: Permite entrar en un directorio escribiendo solo su nombre.
# Ej: Escribir 'Downloads' hace 'cd Downloads'.
setopt AUTO_CD

# -----------------------------------------------------------------------------
# EXPANSIÓN DE ARCHIVOS (GLOBBING)
# -----------------------------------------------------------------------------

# GLOBSTAR: Habilita el uso de '**' para buscar de forma recursiva.
# Ej: 'ls **/*.txt' busca archivos .txt en el directorio actual y subdirectorios.
# En ZSH, ** ya funciona por defecto, pero aseguramos la opción.
setopt GLOB_DOTS

# -----------------------------------------------------------------------------
# INTERFAZ Y VENTANA
# -----------------------------------------------------------------------------

# ZSH verifica el tamaño de la ventana automáticamente.
# No se necesita configuración adicional.

# -----------------------------------------------------------------------------
# AUTOCOMPLETADO
# -----------------------------------------------------------------------------

# Cargar sistema de autocompletado
autoload -Uz compinit
compinit

# Ignorar mayúsculas/minúsculas al tabular.
# Ej: Escribir 'cd doc<TAB>' completará 'Documents'.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Mostrar lista de opciones inmediatamente si hay varias.
zstyle ':completion:*' list-suffixes true

# Usar colores para mostrar los tipos de archivos en las sugerencias.
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# =============================================================================
# MENSAJE DE CARGA
# =============================================================================
echo "✅ Opciones de Shell activadas (autocd, globstar, corrección errores...)"
