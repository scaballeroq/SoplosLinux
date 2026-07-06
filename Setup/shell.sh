#!/bin/bash
# shell.sh - Instalación de herramientas modernas de terminal y prompt Starship para Debian

set -e

echo "ℹ️ Instalando utilidades de terminal modernas..."
sudo apt update
sudo apt install -y \
    eza \
    bat \
    fzf \
    zoxide \
    ripgrep \
    fd-find \
    tealdeer \
    duf \
    du-dust \
    procs

# En Debian, bat y fd tienen nombres diferentes para evitar conflictos
echo "ℹ️ Configurando symlinks para bat y fd..."
mkdir -p ~/.local/bin
[ -f /usr/bin/batcat ] && ln -sf /usr/bin/batcat ~/.local/bin/bat
[ -f /usr/bin/fdfind ] && ln -sf /usr/bin/fdfind ~/.local/bin/fd

echo "✅ Utilidades de terminal instaladas correctamente."

echo "ℹ️ Instalando Starship..."
# El método más fiable en Debian para tener la última versión
curl -sS https://starship.rs/install.sh | sh -s -- -y

# Configuración Modular para ZSH
if [ -d "/etc/zshrc.d" ] || [ -d "$HOME/.zshrc.d" ]; then
    mkdir -p ~/.zshrc.d
    cat <<EOF > ~/.zshrc.d/starship.zsh
# Starship Prompt Configuration
eval "\$(starship init zsh)"
EOF
    echo "✅ Configuración modular de Starship creada en ~/.zshrc.d/starship.zsh"
else
    # Si no hay soporte para .zshrc.d, lo añadimos a .zshrc
    if ! grep -q "starship init zsh" ~/.zshrc; then
        echo '' >> ~/.zshrc
        echo '# Starship Prompt' >> ~/.zshrc
        echo 'eval "$(starship init zsh)"' >> ~/.zshrc
    fi
fi

# Asegurar que existe el directorio de configuración
mkdir -p ~/.config

# Copiar config predeterminada si existe
if [ -f "starship.toml" ]; then
    cp starship.toml ~/.config/starship.toml
elif [ -f "Setup/starship.toml" ]; then
    cp Setup/starship.toml ~/.config/starship.toml
fi

echo "✅ Instalación y configuración completadas. Reinicia la terminal."
