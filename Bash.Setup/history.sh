# =============================================================================
# CONFIGURACIÓN DEL HISTORIAL (history.sh)
# =============================================================================
# Controla cómo zsh recuerda los comandos que escribes.

# Cantidad de comandos a recordar en la sesión actual (memoria)
export HISTSIZE=10000

# Cantidad de comandos a guardar en el archivo ~/.zsh_history
export SAVEHIST=20000

# Opciones de control del historial:
# HIST_IGNORE_SPACE: No guardar líneas que empiezan con un espacio.
# HIST_IGNORE_DUPS: No guardar el comando si es igual al anterior.
# HIST_EXPIRE_DUPS_FIRST: Elimina duplicados anteriores cuando el historial se llena.
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS
setopt HIST_EXPIRE_DUPS_FIRST

# Formato de fecha para el comando 'history'.
# Muestra: Año-Mes-Día Hora:Minuto:Segundo
export HIST_STAMPS="%F %T"

# Guardar comandos multilínea como una sola entrada en el historial.
setopt HIST_SAVE_NO_DUPS

# Añadir al archivo de historial en lugar de sobrescribirlo al salir de la sesión.
# Esto es vital para no perder historial al usar múltiples terminales.
setopt APPEND_HISTORY

# Guardar inmediatamente cada comando al historial (compartir entre sesiones)
setopt INC_APPEND_HISTORY

# Lista de comandos a IGNORAR.
# Estos comandos no se guardarán en el historial para mantenerlo limpio.
# Se ignoran: ls, cd, pwd, exit, clear, history, comandos de job (bg/fg), etc.
export HISTIGNORE="ls:ll:la:cd:pwd:exit:clear:history:bg:fg:..:..."

# =============================================================================
# MENSAJE DE CARGA
# =============================================================================
echo "✅ Historial configurado (10k/20k líneas, ignorar duplicados)"
