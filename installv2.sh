#!/bin/bash
set -e
set -o pipefail

echo "⚡ Iniciando install_v2.sh con validaciones..."

# ================================
# Instalar paquetes base con apt
# ================================
echo "📦 Instalando paquetes base..."
PACKAGES=(
    git curl wget unzip build-essential cmake zsh htop nano locate
    x11vnc btop neofetch feh rofi kitty tilix bat ruby python3 python3-pip python3-venv
)

for pkg in "${PACKAGES[@]}"; do
    if ! dpkg -s "$pkg" &>/dev/null; then
        sudo apt install -y "$pkg"
        echo "✅ Paquete $pkg instalado."
    else
        echo "⚙️  Paquete $pkg ya instalado."
    fi
done

# ================================
# Descargar e instalar lolcat
# ================================
echo "🌈 Instalando lolcat..."
DIRECTORIO_INSTALL=$(pwd)
mkdir -p ~/Tools
cd ~/Tools

if [ ! -d "lolcat-master" ]; then
    wget -O lolcat.zip https://github.com/busyloop/lolcat/archive/master.zip
    unzip lolcat.zip
    cd lolcat-master/bin
    sudo gem install lolcat
    echo "✅ lolcat instalado. Versión: $(lolcat --version)"
else
    echo "⚙️  lolcat ya instalado."
fi

cd "$DIRECTORIO_INSTALL"

# ================================
# Descargar OpenRGB AppImage
# ================================
echo "🎨 Instalando OpenRGB..."
cd ~/Tools
if [ ! -f "OpenRGB_1.0rc2_x86_64_0fca93e.AppImage" ]; then
    wget https://codeberg.org/OpenRGB/OpenRGB/releases/download/release_candidate_1.0rc2/OpenRGB_1.0rc2_x86_64_0fca93e.AppImage
    chmod +x OpenRGB_1.0rc2_x86_64_0fca93e.AppImage
    echo "✅ OpenRGB descargado."
else
    echo "⚙️  OpenRGB ya existe."
fi
cd "$DIRECTORIO_INSTALL"

# ================================
# Cambiar shell predeterminada a Zsh
# ================================
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "⚙️  Estableciendo Zsh como shell predeterminada..."
    chsh -s "$(which zsh)" "$USER"
    echo "✅ Zsh establecida. Cierra sesión o reinicia para aplicar cambios."
else
    echo "✅ Zsh ya es shell predeterminada."
fi

# ================================
# Terminal predeterminada
# ================================
echo
echo "🎛️  Configurando terminal predeterminada..."
TERMINAL_CHOICE=${TERMINAL_CHOICE:-1}  # 1=kitty, 2=tilix

case $TERMINAL_CHOICE in
    1)
        if command -v kitty &>/dev/null; then
            sed -i '/^export TERMINAL=/d' ~/.zshrc
            echo "export TERMINAL=kitty" >> ~/.zshrc
            export TERMINAL=kitty
            echo "✅ Kitty como terminal predeterminada."
        fi
        ;;
    2)
        if command -v tilix &>/dev/null; then
            sed -i '/^export TERMINAL=/d' ~/.zshrc
            echo "export TERMINAL=tilix" >> ~/.zshrc
            export TERMINAL=tilix
            echo "✅ Tilix como terminal predeterminada."
        fi
        ;;
    *)
        echo "⚠️  Opción no válida. Se mantiene la configuración actual."
        ;;
esac

# ================================
# Instalar Oh My Zsh
# ================================
echo "🔧 Instalando Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo "✅ Oh My Zsh instalado."
else
    echo "⚙️  Oh My Zsh ya instalado."
fi

# ================================
# Instalar Powerlevel10k
# ================================
echo "✨ Instalando Powerlevel10k..."
P10K_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

if [ ! -d "$P10K_DIR" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P10K_DIR"
    echo "✅ Powerlevel10k instalado."
else
    echo "⚙️  Powerlevel10k ya existe, actualizando..."
    git -C "$P10K_DIR" pull
fi

# Configurar tema en .zshrc
ZSHRC="$HOME/.zshrc"
if ! grep -q 'ZSH_THEME="powerlevel10k/powerlevel10k"' "$ZSHRC"; then
    sed -i '/^ZSH_THEME=/d' "$ZSHRC"
    echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> "$ZSHRC"
    echo "✅ Tema Powerlevel10k activado en ~/.zshrc"
else
    echo "⚙️  Tema Powerlevel10k ya está activado."
fi

# ================================
# Instalar y habilitar OpenSSH
# ================================
echo "🔐 Instalando y habilitando OpenSSH..."
if ! systemctl is-active --quiet ssh; then
    sudo apt install -y openssh-server
    sudo systemctl enable ssh
    sudo systemctl start ssh
    echo "✅ OpenSSH instalado y activo."
else
    echo "⚙️  OpenSSH ya está activo."
fi

# Copiar banner Lynx
mkdir ~/scripts
mv ./lynx-banner.sh ~/scripts/
chmod +x ~/scripts/lynx-banner.sh

# Configuración mínima de Nano
NANORC="$HOME/.nanorc"

# Crear o actualizar .nanorc con la opción mouse
if [ -f "$NANORC" ]; then
    # Verificar si ya existe la línea
    if ! grep -q "^set mouse" "$NANORC"; then
        echo "set mouse" >> "$NANORC"
        echo "[INFO] 'set mouse' agregado a ~/.nanorc"
    fi
else
    echo "set mouse" > "$NANORC"
    echo "[INFO] ~/.nanorc creado con 'set mouse'"
fi

chown $USER:$USER "$NANORC"
echo "[OK] Nano configurado con soporte de mouse."


# ============================================
# Inyectar aliases/funciones portables en ~/.zshrc
# ============================================
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CUSTOM_ZSH_FILE="$SCRIPT_DIR/custom_aliases.zsh"   # archivo relativo al script
ZSHRC="$HOME/.zshrc"

if [ -f "$CUSTOM_ZSH_FILE" ]; then
    echo "⚡ Procesando $CUSTOM_ZSH_FILE para inyectar en $ZSHRC..."

    # Asegurarnos de que ~/.zshrc exista
    [ -f "$ZSHRC" ] || touch "$ZSHRC"

    # Creamos un archivo temporal con normalización de rutas:
    # Reemplaza /home/<cualquier_usuario> por $HOME (expresado como $HOME literal para que se evalúe dinámicamente)
    TMP=$(mktemp)
    sed -E "s|/home/[^/]+|$HOME|g" "$CUSTOM_ZSH_FILE" > "$TMP"

    # Procesamos por bloques (separados por línea vacía) to preserve multi-line functions
    awk -v zshrc="$ZSHRC" '
    BEGIN { RS=""; FS="\n"; ORS="\n\n" }
    {
        block = $0
        # obtener primer token para decidir tipo: alias o function o nombre de función
        firstline = $1
        if (match(firstline, /^alias[[:space:]]+([a-zA-Z0-9_:-]+)/, m)) {
            name = m[1]
            # buscar alias existente exacto
            cmd = "grep -q \"^alias " name "=\\b\" " zshrc
            if (system(cmd) != 0) {
                print block >> zshrc
                print "ADDED_ALIAS " name
            } else {
                print "SKIP_ALIAS " name
            }
        } else if (match(firstline, /^[[:space:]]*([a-zA-Z0-9_:-]+)[[:space:]]*\\(\\)[[:space:]]*\\{?/, m2)) {
            name = m2[1]
            # buscar función existente (name() or function name)
            cmd = "grep -q \"^" name "\\s*()\\|^function\\s\\+" name "\" " zshrc
            if (system(cmd) != 0) {
                print block >> zshrc
                print "ADDED_FUNC " name
            } else {
                print "SKIP_FUNC " name
            }
        } else {
            # línea libre (no alias ni funcion): comprobar si existe exactamente
            # tomamos la primera línea como identificador
            gsub(/\n/, "\\n", block)
            firstline_esc = gensub(/["\\]/, "\\\\&", "g", firstline)
            cmd = "grep -Fq \"" firstline_esc "\" " zshrc
            if (system(cmd) != 0) {
                print block >> zshrc
                print "ADDED_MISC " firstline
            } else {
                print "SKIP_MISC " firstline
            }
        }
    }' "$TMP" | while read -r status name; do
        # opcional: mostrar resumen en el script
        echo "  -> $status $name"
    done

    rm -f "$TMP"
    echo "✅ Inyección completada (revisa ~/.zshrc para confirmar)."
else
    echo "⚠️  No se encontró $CUSTOM_ZSH_FILE. Saltando inyección de aliases."
fi


echo "🎉 install_v2.sh finalizado correctamente."
