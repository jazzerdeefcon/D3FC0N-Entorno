# BANNER DEFCON
lolcat -S -35 ~/scripts/lynx-banner.sh

#printf "\e[1;94m================================================================= \e[0m\n"
#echo " "
#printf "\e[1;32m     ▓█████▄ ▓█████   █████▒▄████▄   ▒█████   ███▄    █   \e[0m\n"
#printf "\e[1;32m     ▒██▀ ██▌▓█   ▀ ▓██   ▒▒██▀ ▀█  ▒██▒  ██▒ ██ ▀█   █   \e[0m\n"
#printf "\e[1;32m     ░██   █▌▒███   ▒████ ░▒▓█    ▄ ▒██░  ██▒▓██  ▀█ ██▒  \e[0m\n"
#printf "\e[1;32m     ░▓█▄   ▌▒▓█  ▄ ░▓█▒  ░▒▓▓▄ ▄██▒▒██   ██░▓██▒  ▐▌██▒  \e[0m\n"
#printf "\e[1;32m     ░▒████▓ ░▒████▒░▒█░   ▒ ▓███▀ ░░ ████▓▒░▒██░   ▓██░  \e[0m\n"
#echo " "
#printf "\e[94m================================================================= \e[0m\n"



#============== ALIAS DEFCON ==========
# ======================= ALIAS LYNX =================

alias alia="cat ~/.zshrc |grep -oP '^alias \w+=.*'"
alias androidstudio='/home/lynx/tools/android-studio/bin/studio.sh'
alias anonymousid="~/scripts/anonymous-id.sh"
alias ataque="cat ataques.txt |grep -i $1"
alias audio-fix="~/scripts/audio-fix.sh"
alias banda-ancha="speedtest-cli"
#alias base-64="~/scripts/base64.sh"
alias bigo-id='clear && lolcat -S -35 ~/scripts/bigodino.ascii && printf "\e[49m===================================================== \e[0m\n" && cat ~/bigo/users_id.txt | tr '\n' '\0' | sort -z -f | tr '\0' '\n' && printf "\e[49m===================================================== \e[0m\n" '
#alias bigoid='~/scripts/bigoid.sh'
alias bigoid='~/scripts/id-v2.sh'
alias bigohack='~/scripts/search-hacker.sh'
alias bigosendrank="curl -s 'https://ta.bigo.tv/official_website/OInterface/getWeekSendRank' |jq -r"
alias bigorank="curl -s 'https://ta.bigo.tv/official_website/OInterface/getWeekGetRank' |jq -r"
alias bigoreport="/home/defcon/reporte_bigo/bin/python3 /home/defcon/reporte_bigo/reporte_bigo.py"
alias cedulas="python3 /home/defcon/scripts/cedula.py"
alias correocheck="~/scripts/check_correo.sh"
alias cloud="~/scripts/cloud.sh"
alias clouds="python3 ~/tools/CloudFail/cloudfail.py -t -s $1 > ./clouds.$1"
alias codigo='~/scripts/code-http.sh' #Ver el codigo de estado de un dominio
alias color="~/scripts/colores1.sh"
alias comp='sudo mount -t cifs //192.168.1.66/Users/D3FC0N/Documents/Dell-linux ~/compartida -o username=D3FC0N,password=jazzer_8.'
alias codigohttp="clear && python3 ~/scripts/codigo-http.py"
alias codigo-http="~/scripts/code-http.sh"
alias conexionwifi="~/scripts/conexionwifi.sh"
alias cve-search="~/scripts/CVE_Search.sh"
alias defcel='~/scripts/cel-gathering.sh'
alias delid='function _delid() { rm ~/bigo/bigo-2023/id/$1; }; _delid'
alias directorios="sudo ~/scripts/dirsubfinder.sh"
alias documentodominio="~/scripts/DocumentosDeDominios.sh"
alias dklabs='rsync -avz ./ Jazzer@192.168.1.100:"/volume1/web/Muller/labs/"'
alias dkup='~/scripts/auto_deploy.sh'
alias escalas="python3 ~/scripts/escalas.py"
alias espaciohdd='df -h --output=source,size,used,avail,pcent,target | grep -E "^(/dev|Sist)"'
alias idsearch="~/scripts/id.sh"
alias fakeanonymous="clear && lolcat -S -35 ~/scripts/skull.ascii && cat /home/lynx/bigo/bigo-2023/Anonymous-ID/anonymousid.txt"
alias familiasbigo="~/scripts/bigoidfamilias.sh"
alias geo="~/scripts/geo.sh"
alias geo1="python3 ~/scripts/geo.py && chmod +x ~/scripts/location_data.json && cat ~/scripts/location_data.json"
alias genpass='~/scripts/contraseña.sh'
#alias gitp ='git add . && git commit -m \"Modificaciones\" && git push'
alias ifconfig='/usr/sbin/ifconfig'
alias instadif='rel && python3 ~/scripts/instagram_diferencia.py'
alias instaid='rel && python3 insta_perfil.py'
alias ipdefcon="~/scripts/interfaz.sh"
alias ipub="clear && curl -s http://ipecho.net | grep -oP 'Your IP is \K[^*<]+'"
alias lada="clear && ~/scripts/lada_mx.sh"
alias live='~/scripts/live.sh'
alias live-tiktok='~/scripts/live-tiktok.sh'
alias luz='~/scripts/luz.sh'
alias macmodem="~/scripts/modems.sh"
alias map="/home/lynx/scripts/map.sh"
alias neo='clear && cat ~/scripts/neofetch'
alias ns="nslookup $1"
alias obsidian='~/tools/Obsidian-1.7.4.AppImage /dev/null 2>&1 & disown'
alias bigobanda="~/scripts/bigobanda.sh"
alias pass="cat /usr/share/seclist/Passwords/rockyou.txt |grep "
alias pais='~/scripts/pais-prefijo.sh'
alias prefijo-a='curl -s https://ta.bigo.tv/official_website/OInterface/getCountryInfoList |jq -r'
alias pscan='~/scripts/ping-scanner.sh'
alias ping-scan="~/scripts/ping-scanner.sh"
alias proc="~/scripts/proc.sh"
alias prox='proxychains $1'
alias pscan='~/scripts/ping-scanner.sh'
alias recon='~/scripts/recon.sh'
alias rel='clear'
alias reboot='sudo reboot now'
alias re='source ~/.zshrc'
alias ru='python3 ~/scripts/ru.py'
alias rutas='clear && print "sublist3r -b -t 50 -d $1" && sudo sublist3r -b -t 50 -d $1'
alias scanlan="~/scripts/scanLan.sh"
alias servercomp="clear & hostname -I & sudo python3 -m http.server 80"
alias show_id='function _show_id() { cat ~/bigo/bigo-2023/id/$1.txt; }; _show_id'
alias smule="~/scripts/smule_search_songs.py"
#alias smulelist="awk -F'Título : ' '!seen[$2]++ {print $2}' ~/Smule/canciones.txt | sort"
alias socialanalyzer='~/scripts/social-analyzer.sh'
alias ssh-comando='cat ~/scripts/transferencia-ssh.txt'
alias ssh-pass='ssh-add ~/.ssh/id_rsa'
alias ddos='python3 /home/defcon/scripts/poison.py'
alias rfc_check="~/scripts/rfc.sh"
alias repotelmex='python3 ~/scripts/seguimiento_telmex.py'
alias tarot="python3 ~/scripts/tarot.py"
alias runfbi='/home/defcon/env_cloudscraper/bin/python3 /home/defcon/env_cloudscraper/prueba_fbi_3.py'
alias rustvnc="~/scripts/rustdesk/rustdesk-1.4.3-x86_64.AppImage"
alias tiktok="~/scripts/tiktok-profile.sh"
alias t0r='~/scripts/tor.sh'
alias transmisionbigo="~/scripts/id_transmitiendo_bigo2.sh"
alias urlencode='python3 -c "import sys, urllib.parse as ul; print(ul.quote_plus(sys.argv[1]))"'
alias urldecode='python3 -c "import sys, urllib.parse as ul; print(ul.unquote_plus(sys.argv[1]))"'
alias viboritadoc="~/RFC/Viborita_documentos.sh"
alias video='~/scripts/vi.sh'
alias virtualbox='clear && /usr/bin/virtualbox'
alias vnc='x11vnc -noncache'
alias vncn='x11vnc -noncache'
alias vpn='sudo openvpn --config /home/lynx/VPN/lab_Jazzer.ovpn'
alias vuln='cat ~/rockyou.txt | grep $1'






#======== FUNCIONES ==========

#=========FUNCION SMULE========
#smulelist() {
 #   awk -F'Título : ' '!seen[$2]++ {print $2}' ~/Smule/canciones.txt | sort
#}

#=========FUNCION SMULE========

smulelist() {
    clear && awk '
    /Usuario:/ {usuario=$2}
    /Artista:/ {artista=$2}
    /Título :/ {
        titulo=$2
        if (!seen[titulo"| "artista"| "usuario]++) print titulo " | " artista " | " usuario
    }' FS=": " ~/Smule/canciones.txt | sort
}

#==============================

function eports1(){
echo -e "\n${yellowColour}[*] Extracting information...${endColour}\n"
ip_address=$(cat allPorts  | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u)
open_ports=$(cat allPorts | grep -oP '\d{1,5}/open' |awk '{print $1}' FS="/" | xargs | tr ' ' ',')
echo -e "\t${redColour} [*] IP Address: ${endColour}${greenColour}$ip_address ${endColour}"
echo -e "\t${redColour} [*] Open Ports: ${endColour}${greenColour}$open_ports ${endColour}\n"
echo $open_ports | tr -d '\n' | xclip -sel clip
echo -e "${yellowColour} [*] Puertos copiados en clipboard!${endColour}\n"
}

function mkd(){
	mkdir {nmap,contest,scripts,tmp,exploits}
}

function iptool(){

echo -e "\n${yellowColour}[*] Extracting information...${endColour}\n"
ip_address=$(cat allPorts  | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u)
open_ports=$(cat allPorts | grep -oP '\d{1,5}/open' |awk '{print $1}' FS="/" | xargs | tr ' ' ',')
echo -e "\t${redColour} [*] IP Address: ${endColour}${greenColour}$ip_address ${endColour}"
echo -e "\t${redColour} [*] Open Ports: ${endColour}${greenColour}$open_ports ${endColour}\n"
echo $open_ports | tr -d '\n' | xclip -sel clip
echo -e "${yellowColour} [*] Puertos copiados en clipboard!${endColour}\n"
}

function grep_id() {
    grep -r -i "$1" /home/lynx/bigo/bigo-2023/id | sed 's/.*\///'
}

#function listid() {
 #   ls -1 /home/lynx/bigo/bigo-2023/id
#}

function listid() {
    cd /home/lynx/bigo/bigo-2023/id
    for file in *; do
        echo "$file"
    done
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Created by `pipx` on 2025-07-05 00:26:58
export PATH="$PATH:/home/defcon/.local/bin"

#==============
#FUNCION SETTARGET
#==============

# --- Función para guardar el target ---
function settarget() {
    ip_address=$1
    machine_name=$2
    echo "$ip_address $machine_name" > ~/.config/bin/target
}

# --- Función para limpiar o quitar el target ---
function cleartarget() {
    rm -f ~/.config/bin/target
}

# --- Mostrar el target encima del prompt ---
show_target() {
    if [ -f ~/.config/bin/target ]; then
        read ip name < ~/.config/bin/target
        echo ""
        echo -e "\e[1;31m[\e[0;21;35m${name}\e[0m\e[1;31m]\e[91m-\e[1;31m[\e[1;21;35m${ip}\e[0m\e[1;31m]\e[0m\n"  
    fi
}

# --- Personalizar el prompt ---
# para bash
if [ -n "$BASH_VERSION" ]; then
    PS1='$(show_target)\n\[\e[1;32m\]\u@\h\[\e[0m\]:\w\$ '
fi
# para zsh
if [ -n "$ZSH_VERSION" ]; then
  PROMPT='$(show_target)
%F{red}%n%f:%~$ '
fi

