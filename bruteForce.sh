#!/bin/bash
# by @m4lal0

# Regular Colors
Black='\033[0;30m'      # Black
Red='\033[0;31m'        # Red
Green='\033[0;32m'      # Green
Yellow='\033[0;33m'     # Yellow
Blue='\033[0;34m'       # Blue
Purple='\033[0;35m'     # Purple
Cyan='\033[0;36m'       # Cyan
White='\033[0;97m'      # White
Color_Off='\033[0m'     # Text Reset

# Additional colors
LGray='\033[0;37m'      # Ligth Gray
DGray='\033[0;90m'      # Dark Gray
LRed='\033[0;91m'       # Ligth Red
LGreen='\033[0;92m'     # Ligth Green
LYellow='\033[0;93m'    # Ligth Yellow
LBlue='\033[0;94m'      # Ligth Blue
LPurple='\033[0;95m'    # Light Purple
LCyan='\033[0;96m'      # Ligth Cyan

# Bold
BBlack='\033[1;30m'     # Black
BGray='\033[1;37m'		# Gray
BRed='\033[1;31m'       # Red
BGreen='\033[1;32m'     # Green
BYellow='\033[1;33m'    # Yellow
BBlue='\033[1;34m'      # Blue
BPurple='\033[1;35m'    # Purple
BCyan='\033[1;36m'      # Cyan
BWhite='\033[1;37m'     # White

# Underline
UBlack='\033[4;30m'     # Black
UGray='\033[4;37m'		# Gray
URed='\033[4;31m'       # Red
UGreen='\033[4;32m'     # Green
UYellow='\033[4;33m'    # Yellow
UBlue='\033[4;34m'      # Blue
UPurple='\033[4;35m'    # Purple
UCyan='\033[4;36m'      # Cyan
UWhite='\033[4;37m'     # White

# Background
On_Black='\033[40m'     # Black
On_Red='\033[41m'       # Red
On_Green='\033[42m'     # Green
On_Yellow='\033[43m'    # Yellow
On_Blue='\033[44m'      # Blue
On_Purple='\033[45m'    # Purple
On_Cyan='\033[46m'      # Cyan
On_White='\033[47m'     # White

trap ctrl_c INT

function ctrl_c(){
    echo -e "\n\n${Cyan}[${BYellow}!${Cyan}] ${BRed}Saliendo de la aplicación...${Color_Off}"
    tput cnorm; exit 1
}

function banner(){
    clear
    echo -e "\t${LRed}_________________________________________________________________________________"
    echo -e "\t__|___|____|_____|______|_______|___|___|____|________|_____|______|__|____|___|_"
    echo -e "\t_|___|______|_______|_____|____|___|______|____|___|_________|____|${LRed}By${LRed}_${LYellow}@m4lal0${LRed}_|__"
    echo -e "\t\  |______|__|____|_____/  |_____|____\_   _____/___|______|__|_____|_______|____"
    echo -e "\t_| __ \_\    _ \|  |   \    _\_/  _ \_|_|  ___)___/ __ \_\    _ \_/ ___\__/  _ \_"
    echo -e "\t_| \_\ \_|  |_\/|  |  /_|  |__\   __/___|  \___|_(  \_\ )_|  |_\/\  \____\   __/_"
    echo -e "\t_|___  /_|__|___|____/__|__|___\___  /_/___  /|___\____/__|__|____\___  /_\___  /"
    echo -e "\t_____\/___|_______|_______|________\/______\/__|___|_______|__________\/______\/_"
    echo -e "\t__|________|_________|___|______|_______|_____|______|______|_______|______|_____${Color_Off}\n"
}

function helpPanel(){
    echo -e "\n${BGray}Script para realizar fuerza bruta a diferentes servicios.${Color_Off}"
    echo -e "\n${BGray}USO:${Color_Off}"
    echo -e "\t${BGray}./bruteForce.sh ${BRed}[opcion]${Color_Off}"
    echo -e "\n${BGray}OPCIONES:${Color_Off}"
    echo -e "\t${Cyan}[${BRed}-i <ip-address>${Cyan}] \t${BPurple}IP del host objetivo.${Color_Off}"
    echo -e "\t${Cyan}[${BRed}-s <service>${Cyan}] \t\t${BPurple}Nombre del Servicio: [FTP|SSH|MYSQL|TELNET|VNC|HTTP|JOOMLA|WORDPRESS].${Color_Off}"
    echo -e "\t${Cyan}[${BRed}-p <port-range>${Cyan}] \t${BPurple}Especificar otro puerto o rango de puertos del servicio.${Color_Off}"
    echo -e "\t${Cyan}[${BRed}-o <file>${Cyan}] \t\t${BPurple}Guardar el resultado en un archivo.${Color_Off}"
    echo -e "\t${Cyan}[${BRed}-h${Cyan}] \t\t\t${BPurple}Mostrar este panel de ayuda.${Color_Off}"
    echo -e "\n${BGray}EJEMPLOS:${Color_Off}"
    echo -e "\t${BGreen}./bruteForce.sh -i <ip-address> -s ftp ${LGray}: Brute Force al servicio FTP por el puerto por default.${Color_Off}"
    echo -e "\t${BGreen}./bruteForce.sh -i <ip-address> -s ssh -o prueba ${LGray}: Brute Force al servicio SSH y guardar el resultado en un archivo.${Color_Off}"
    echo -e "\t${BGreen}./bruteForce.sh -i <ip-address> -s http -p 8080,8081 ${LGray}: Brute Force al servicio HTTP en los puertos 8080 y 8081.${Color_Off}\n"
    tput cnorm; exit 0
}

function dependencies(){
	dependencies=(nmap)
	echo -e "${Cyan}[${BYellow}!${Cyan}] ${BYellow}Comprobando programas necesarios...${Color_Off}"
	sleep 2
	for program in "${dependencies[@]}"; do
		echo -ne "\n${Cyan}[${BBlue}*${Cyan}] ${BBlue}Herramienta ${BGreen}$program${BBlue}...${Color_Off}"
		test -f /usr/bin/$program
		if [ "$(echo $?)" == "0" ]; then
			echo -e " ${Cyan}[${BGreen}✔${Cyan}]${Color_Off}"
		else
			echo -e " ${Cyan}[${BRed}✘${Cyan}]${Color_Off}\n"
			echo -e "${Cyan}[${BBlue}*${Cyan}] ${BBlue}Instalando herramienta ${BGreen}$program${BBlue}...${Color_Off}"
			apt-get install $program -y > /dev/null 2>&1
		fi; sleep 1
	done
}

declare -i parameter_counter=0; while getopts "i:s:o:p:h:" opt; do
    case $opt in
        i) HOST_IP=$OPTARG && let parameter_counter+=1 ;;
        s) SERVICE=$OPTARG && let parameter_counter+=1 ;;
        o) OUTPUT=$OPTARG && let parameter_counter+=1 ;;
        p) PORT=$OPTARG && let parameter_counter+=1 ;;
        h) helpPanel ;;
    esac
done

if [ $parameter_counter -eq 0 ]; then
    banner
    helpPanel
else
    if [ "$(echo $HOST_IP)" ]; then
    tput civis; dependencies ; banner
        if [ "$(echo $SERVICE)" == "FTP" ] || [ "$(echo $SERVICE)" == "ftp" ]; then
            if [ ! "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-FTP
                PORT=21
                nmap -v --script ftp-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                nmap -v --script ftp-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                PORT=21
                nmap -v --script ftp-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ ! "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-FTP
                nmap -v --script ftp-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            fi
        elif [ "$(echo $SERVICE)" == "SSH" ] || [ "$(echo $SERVICE)" == "ssh" ]; then
            if [ ! "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-SSH
                PORT=22
                nmap -v --script ssh-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                nmap -v --script ssh-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                PORT=22
                nmap -v --script ssh-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ ! "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-SSH
                nmap -v --script ssh-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            fi
        elif [ "$(echo $SERVICE)" == "MYSQL" ] || [ "$(echo $SERVICE)" == "mysql" ]; then
            if [ ! "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-MYSQL
                PORT=3306
                nmap -v --script mysql-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                nmap -v --script mysql-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                PORT=3306
                nmap -v --script mysql-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ ! "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-MYSQL
                nmap -v --script mysql-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            fi
        elif [ "$(echo $SERVICE)" == "TELNET" ] || [ "$(echo $SERVICE)" == "telnet" ]; then
            if [ ! "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-TELNET
                PORT=23
                nmap -v --script telnet-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                nmap -v --script telnet-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                PORT=23
                nmap -v --script telnet-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ ! "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-TELNET
                nmap -v --script telnet-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            fi
        elif [ "$(echo $SERVICE)" == "VNC" ] || [ "$(echo $SERVICE)" == "vnc" ]; then
            if [ ! "$(echo $OUTPUT)" ]; then
                OUTPUT=$HOST_IP-VNC
                nmap -v --script vnc-brute $HOST_IP -oN $OUTPUT
                tput cnorm
            else
                nmap -v --script vnc-brute $HOST_IP -oN $OUTPUT
                tput cnorm
            fi
        elif [ "$(echo $SERVICE)" == "HTTP" ] || [ "$(echo $SERVICE)" == "http" ]; then
            if [ ! "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-HTTP
                PORT="80,43"
                nmap -v --script http-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                nmap -v --script http-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                PORT="80,43"
                nmap -v --script http-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ ! "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-HTTP
                nmap -v --script http-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            fi
        elif [ "$(echo $SERVICE)" == "JOOMLA" ] || [ "$(echo $SERVICE)" == "joomla" ]; then
            if [ ! "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-JOOMLA
                PORT="80,43"
                nmap -v --script http-joomla-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                nmap -v --script http-joomla-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                PORT="80,43"
                nmap -v --script http-joomla-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ ! "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-JOOMLA
                nmap -v --script http-joomla-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            fi
        elif [ "$(echo $SERVICE)" == "WORDPRESS" ] || [ "$(echo $SERVICE)" == "wordpress" ]; then
            if [ ! "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-WORDPRESS
                PORT="80,43"
                nmap -v --script http-wordpress-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                nmap -v --script http-wordpress-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                PORT="80,43"
                nmap -v --script http-wordpress-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ ! "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-WORDPRESS
                nmap -v --script http-wordpress-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            fi
        else
            helpPanel
        fi
    else
        banner
        helpPanel
    fi
fi