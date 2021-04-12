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
Blink='\033[5m'         # Blink
Color_Off='\033[0m'     # Text Reset

# Additional colors
LGray='\033[0;90m'      # Ligth Gray
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

# Italics
IBlack='\033[3;30m'     # Black
IGray='\033[3;90m'      # Gray
IRed='\033[3;31m'       # Red
IGreen='\033[3;32m'     # Green
IYellow='\033[3;33m'    # Yellow
IBlue='\033[3;34m'      # Blue
IPurple='\033[3;35m'    # Purple
ICyan='\033[3;36m'      # Cyan
IWhite='\033[3;37m'     # White

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
    echo -e "\t${Cyan}[${BRed}-t, --target <target>${Cyan}] \t${BPurple}Dirección IP del objetivo.${Color_Off}"
    echo -e "\t${Cyan}[${BRed}-s, --service <service>${Cyan}] \t${BPurple}Nombre del Servicio: [FTP|SSH|TELNET|SMTP|POP3|SMB|SNMP|LDAP|REXEC|RLOGIN|IMAP|${Color_Off}"
    echo -e "\t\t\t\t\t${BPurple}ORACLE|MYSQL|VNC|HTTP|JOOMLA|WORDPRESS|IRC|ALL].${Color_Off}"
    echo -e "\t${Cyan}[${BRed}-p, --port <port-range>${Cyan}] \t${BPurple}Especificar otro puerto o rango de puertos del servicio.${Color_Off}"
    echo -e "\t${Cyan}[${BRed}-o, --output <file>${Cyan}] \t\t${BPurple}Guardar el resultado en un archivo.${Color_Off}"
    echo -e "\t${Cyan}[${BRed}-h, --help${Cyan}] \t\t\t${BPurple}Mostrar este panel de ayuda.${Color_Off}"
    echo -e "\n${BGray}EJEMPLOS:${Color_Off}"
    echo -e "\t${BGreen}./bruteForce.sh -t <target> -s ftp ${IGray}: Fuerza bruta al servicio FTP por el puerto por default.${Color_Off}"
    echo -e "\t${BGreen}./bruteForce.sh -t <target> -s ssh -o prueba ${IGray}: Fuerza bruta al servicio SSH y guardar el resultado en un archivo.${Color_Off}"
    echo -e "\t${BGreen}./bruteForce.sh -t <target> -s http -p 8080,8081 ${IGray}: Fuerza bruta al servicio HTTP en los puertos 8080 y 8081.${Color_Off}"
    echo -e "\t${BGreen}./bruteForce.sh -t <target> --service all ${IGray}: Realiza fuerza bruta a todos los servicios que encuentra.${Color_Off}\n"
    tput cnorm; exit 0
}

function dependencies(){
	dependencies=(nmap)
	echo -e "\n${Cyan}[${BYellow}!${Cyan}] ${BYellow}Comprobando programas necesarios...${Color_Off}"
	sleep 2
	for program in "${dependencies[@]}"; do
		echo -ne "\n${Cyan}[${BBlue}*${Cyan}] ${BBlue}Herramienta ${IGreen}$program${BBlue}...${Color_Off}"
		test -f /usr/bin/$program
		if [ "$(echo $?)" == "0" ]; then
			echo -e " ${Cyan}[${BGreen}✔${Cyan}]${Color_Off}"
		else
			echo -e " ${Cyan}[${BRed}✘${Cyan}]${Color_Off}\n"
			echo -e "${Cyan}[${BBlue}*${Cyan}] ${BBlue}Instalando herramienta ${IGreen}$program${BBlue}...${Color_Off}"
			apt-get install $program -y > /dev/null 2>&1
		fi; sleep 1
	done
}

arg=""
for arg; do
	delim=""
	case $arg in
		--target)	args="${args}-t";;
		--service)	args="${args}-s";;
		--output)	args="${args}-o";;
        --port)	    args="${args}-p";;
        --help)	    args="${args}-h";;
		*) [[ "${arg:0:1}" == "-" ]] || delim="\""
        args="${args}${delim}${arg}${delim} ";;
	esac
done

eval set -- $args

declare -i parameter_counter=0; while getopts ":t:s:o:p:h:" opt; do
    case $opt in
        t) HOST_IP=$OPTARG && let parameter_counter+=1 ;;
        s) SERVICE=$OPTARG && let parameter_counter+=1 ;;
        o) OUTPUT=$OPTARG && let parameter_counter+=1 ;;
        p) PORT=$OPTARG && let parameter_counter+=1 ;;
        h) helpPanel ;;
    esac
done

if [ "$EUID" -ne 0 ]; then
	echo -e "\n${Cyan}[${BYellow}!${Cyan}] ${BRed}Este script debe ser ejecutado por r00t!${Color_Off}\n"
	exit 1
fi

if [ $parameter_counter -eq 0 ]; then
    banner
    helpPanel
else
    if [ "$(echo $HOST_IP)" ]; then
    tput civis; dependencies ; banner
        if [ "$(echo $SERVICE)" == "FTP" ] || [ "$(echo $SERVICE)" == "ftp" ]; then
            echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio FTP  =====${Color_Off}"
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
            echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio SSH  =====${Color_Off}"
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
            echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio MySQL  =====${Color_Off}"
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
            echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio Telnet  =====${Color_Off}"
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
            echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio VNC  =====${Color_Off}"
            if [ ! "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-VNC
                PORT="5900,5901"
                nmap -v --script vnc-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                nmap -v --script vnc-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                PORT="5900,5901"
                nmap -v --script vnc-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ ! "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-VNC
                nmap -v --script vnc-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            fi
        elif [ "$(echo $SERVICE)" == "HTTP" ] || [ "$(echo $SERVICE)" == "http" ]; then
            echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio HTTP  =====${Color_Off}"
            if [ ! "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-HTTP
                PORT="80,443"
                nmap -v --script http-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                nmap -v --script http-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                PORT="80,443"
                nmap -v --script http-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ ! "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-HTTP
                nmap -v --script http-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            fi
        elif [ "$(echo $SERVICE)" == "JOOMLA" ] || [ "$(echo $SERVICE)" == "joomla" ]; then
            echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio Joomla  =====${Color_Off}"
            if [ ! "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-JOOMLA
                PORT="80,443"
                nmap -v --script http-joomla-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                nmap -v --script http-joomla-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                PORT="80,443"
                nmap -v --script http-joomla-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ ! "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-JOOMLA
                nmap -v --script http-joomla-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            fi
        elif [ "$(echo $SERVICE)" == "WORDPRESS" ] || [ "$(echo $SERVICE)" == "wordpress" ]; then
            echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio Wordpress  =====${Color_Off}"
            if [ ! "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-WORDPRESS
                PORT="80,443"
                nmap -v --script http-wordpress-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                nmap -v --script http-wordpress-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                PORT="80,443"
                nmap -v --script http-wordpress-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ ! "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-WORDPRESS
                nmap -v --script http-wordpress-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            fi
        elif [ "$(echo $SERVICE)" == "SMTP" ] || [ "$(echo $SERVICE)" == "smtp" ]; then
            echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio SMTP  =====${Color_Off}"
            if [ ! "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-SMTP
                PORT=25
                nmap -v --script smtp-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                nmap -v --script smtp-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                PORT=25
                nmap -v --script smtp-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ ! "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-SMTP
                nmap -v --script smtp-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            fi
        elif [ "$(echo $SERVICE)" == "POP3" ] || [ "$(echo $SERVICE)" == "pop3" ]; then
            echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio POP3  =====${Color_Off}"
            if [ ! "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-POP3
                PORT="110,445"
                nmap -v --script pop3-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                nmap -v --script pop3-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                PORT="110,445"
                nmap -v --script pop3-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ ! "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-POP3
                nmap -v --script pop3-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            fi
        elif [ "$(echo $SERVICE)" == "SMB" ] || [ "$(echo $SERVICE)" == "smb" ]; then
            echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio SMB  =====${Color_Off}"
            if [ ! "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-SMB
                PORT=162
                nmap -v --script smb-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                nmap -v --script smb-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                PORT=162
                nmap -v --script smb-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ ! "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-SMB
                nmap -v --script smb-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            fi
        elif [ "$(echo $SERVICE)" == "LDAP" ] || [ "$(echo $SERVICE)" == "ldap" ]; then
            echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio LDAP  =====${Color_Off}"
            if [ ! "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-LDAP
                PORT=389
                nmap -v --script ldap-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                nmap -v --script ldap-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                PORT=389
                nmap -v --script ldap-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ ! "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-LDAP
                nmap -v --script ldap-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            fi
        elif [ "$(echo $SERVICE)" == "REXEC" ] || [ "$(echo $SERVICE)" == "recex" ]; then
            echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio rexec  =====${Color_Off}"
            if [ ! "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-REXEC
                PORT=512
                nmap -v --script rexec-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                nmap -v --script rexec-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                PORT=512
                nmap -v --script rexec-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ ! "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-REXEC
                nmap -v --script rexec-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            fi
        elif [ "$(echo $SERVICE)" == "RLOGIN" ] || [ "$(echo $SERVICE)" == "rlogin" ]; then
            echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio rlogin  =====${Color_Off}"
            if [ ! "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-RLOGIN
                PORT=513
                nmap -v --script rlogin-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                nmap -v --script rlogin-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                PORT=513
                nmap -v --script rlogin-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ ! "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-RLOGIN
                nmap -v --script rlogin-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            fi
        elif [ "$(echo $SERVICE)" == "IMAP" ] || [ "$(echo $SERVICE)" == "imap" ]; then
            echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio IMAP  =====${Color_Off}"
            if [ ! "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-IMAP
                PORT=993
                nmap -v --script imap-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                nmap -v --script imap-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                PORT=993
                nmap -v --script imap-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ ! "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-IMAP
                nmap -v --script imap-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            fi
        elif [ "$(echo $SERVICE)" == "ORACLE" ] || [ "$(echo $SERVICE)" == "oracle" ]; then
            echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio ORACLE  =====${Color_Off}"
            if [ ! "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-ORACLE
                PORT=1521
                nmap -v --script oracle-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                nmap -v --script oracle-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                PORT=1521
                nmap -v --script oracle-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ ! "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-ORACLE
                nmap -v --script oracle-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            fi
        elif [ "$(echo $SERVICE)" == "IRC" ] || [ "$(echo $SERVICE)" == "irc" ]; then
            echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio IRC  =====${Color_Off}"
            if [ ! "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-IRC
                PORT=6667
                nmap -v --script irc-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                nmap -v --script irc-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ "$(echo $OUTPUT)" ] && [ ! "$(echo $PORT)" ]; then
                PORT=6667
                nmap -v --script irc-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            elif [ ! "$(echo $OUTPUT)" ] && [ "$(echo $PORT)" ]; then
                OUTPUT=$HOST_IP-IRC
                nmap -v --script irc-brute -p$PORT $HOST_IP -oN $OUTPUT
                tput cnorm
            fi
        elif [ "$(echo $SERVICE)" == "ALL" ] || [ "$(echo $SERVICE)" == "all" ]; then
            nmap -T4 -P0 --open $HOST_IP -p21,22,23,25,80,110,162,389,443,445,512,513,993,3306,1521,5900,5901,6667 -oN nmap-$HOST_IP &> /dev/null
            echo -e "\n${On_White}${BBlack}=====  Puertos Abiertos  =====${Color_Off}"
            cat nmap-$HOST_IP | grep -w "open" | grep -v "Nmap"
            PORT_21=`grep '21/tcp' nmap-$HOST_IP | grep -oP '\d{1,5}/tcp' | awk '{print $1}' FS='/' | xargs`
            PORT_22=`grep '22/tcp' nmap-$HOST_IP | grep -oP '\d{1,5}/tcp' | awk '{print $1}' FS='/' | xargs`
            PORT_23=`grep '23/tcp' nmap-$HOST_IP | grep -oP '\d{1,5}/tcp' | awk '{print $1}' FS='/' | xargs`
            PORT_25=`grep '25/tcp' nmap-$HOST_IP | grep -oP '\d{1,5}/tcp' | awk '{print $1}' FS='/' | xargs`
            PORT_80=`grep '80/tcp' nmap-$HOST_IP | grep -oP '\d{1,5}/tcp' | awk '{print $1}' FS='/' | xargs`
            PORT_110=`grep '110/tcp' nmap-$HOST_IP | grep -oP '\d{1,5}/tcp' | awk '{print $1}' FS='/' | xargs`
            PORT_162=`grep '162/tcp' nmap-$HOST_IP | grep -oP '\d{1,5}/tcp' | awk '{print $1}' FS='/' | xargs`
            PORT_389=`grep '389/tcp' nmap-$HOST_IP | grep -oP '\d{1,5}/tcp' | awk '{print $1}' FS='/' | xargs`
            PORT_443=`grep '443/tcp' nmap-$HOST_IP | grep -oP '\d{1,5}/tcp' | awk '{print $1}' FS='/' | xargs`
            PORT_445=`grep '445/tcp' nmap-$HOST_IP | grep -oP '\d{1,5}/tcp' | awk '{print $1}' FS='/' | xargs`
            PORT_512=`grep '512/tcp' nmap-$HOST_IP | grep -oP '\d{1,5}/tcp' | awk '{print $1}' FS='/' | xargs`
            PORT_513=`grep '513/tcp' nmap-$HOST_IP | grep -oP '\d{1,5}/tcp' | awk '{print $1}' FS='/' | xargs`
            PORT_993=`grep '993/tcp' nmap-$HOST_IP | grep -oP '\d{1,5}/tcp' | awk '{print $1}' FS='/' | xargs`
            PORT_3306=`grep '3306/tcp' nmap-$HOST_IP | grep -oP '\d{1,5}/tcp' | awk '{print $1}' FS='/' | xargs`
            PORT_1521=`grep '1521/tcp' nmap-$HOST_IP | grep -oP '\d{1,5}/tcp' | awk '{print $1}' FS='/' | xargs`
            PORT_5900=`grep '5900/tcp' nmap-$HOST_IP | grep -oP '\d{1,5}/tcp' | awk '{print $1}' FS='/' | xargs`
            PORT_5901=`grep '5901/tcp' nmap-$HOST_IP | grep -oP '\d{1,5}/tcp' | awk '{print $1}' FS='/' | xargs`
            PORT_6667=`grep '6667/tcp' nmap-$HOST_IP | grep -oP '\d{1,5}/tcp' | awk '{print $1}' FS='/' | xargs`

            if [ ! -z "$PORT_21" ]; then
                echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio FTP  =====${Color_Off}"
                OUTPUT=$HOST_IP-FTP
                nmap -v --script ftp-brute -p$PORT_21 $HOST_IP -oN $OUTPUT
            fi
            if [ ! -z "$PORT_22" ]; then
                echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio SSH  =====${Color_Off}"
                OUTPUT=$HOST_IP-SSH
                nmap -v --script ssh-brute -p$PORT_22 $HOST_IP -oN $OUTPUT
            fi
            if [ ! -z "$PORT_23" ]; then
                echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio TELNET  =====${Color_Off}"
                OUTPUT=$HOST_IP-TELNET
                nmap -v --script telnet-brute -p$PORT_23 $HOST_IP -oN $OUTPUT
            fi
            if [ ! -z "$PORT_25" ]; then
                echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio SMTP  =====${Color_Off}"
                OUTPUT=$HOST_IP-SMTP
                nmap -v --script smtp-brute -p$PORT_25 $HOST_IP -oN $OUTPUT
            fi
            if [ ! -z "$PORT_80" ]; then
                echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio HTTP  =====${Color_Off}"
                OUTPUT=$HOST_IP-HTTP
                nmap -v --script http-enum -p$PORT_80 $HOST_IP -oN $OUTPUT
                echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio Joomla  =====${Color_Off}"
                OUTPUT=$HOST_IP-JOOMLA
                nmap -v --script http-joomla-brute -p$PORT_80 $HOST_IP -oN $OUTPUT
                echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio Wordpress  =====${Color_Off}"
                OUTPUT=$HOST_IP-WORDPRESS
                nmap -v --script http-wordpress-brute -p$PORT_80 $HOST_IP -oN $OUTPUT
            fi
            if [ ! -z "$PORT_443" ]; then
                echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio HTTP  =====${Color_Off}"
                OUTPUT=$HOST_IP-HTTP
                nmap -v --script http-enum -p$PORT_443 $HOST_IP -oN $OUTPUT
                echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio Joomla  =====${Color_Off}"
                OUTPUT=$HOST_IP-JOOMLA
                nmap -v --script http-joomla-brute -p$PORT_443 $HOST_IP -oN $OUTPUT
                echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio Wordpress  =====${Color_Off}"
                OUTPUT=$HOST_IP-WORDPRESS
                nmap -v --script http-wordpress-brute -p$PORT_443 $HOST_IP -oN $OUTPUT
            fi
            if [ ! -z "$PORT_110" ]; then
                echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio POP3  =====${Color_Off}"
                OUTPUT=$HOST_IP-POP3
                nmap -v --script pop3-brute -p$PORT_110 $HOST_IP -oN $OUTPUT
            fi
            if [ ! -z "$PORT_445" ]; then
                echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio POP3  =====${Color_Off}"
                OUTPUT=$HOST_IP-POP3
                nmap -v --script pop3-brute -p$PORT_445 $HOST_IP -oN $OUTPUT
            fi
            if [ ! -z "$PORT_162" ]; then
                echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio SMB  =====${Color_Off}"
                OUTPUT=$HOST_IP-SMB
                nmap -v --script smb-brute -p$PORT_162 $HOST_IP -oN $OUTPUT
            fi
            if [ ! -z "$PORT_389" ]; then
                echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio LDAP  =====${Color_Off}"
                OUTPUT=$HOST_IP-LDAP
                nmap -v --script ldap-brute -p$PORT_389 $HOST_IP -oN $OUTPUT
            fi
            if [ ! -z "$PORT_512" ]; then
                echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio rexec  =====${Color_Off}"
                OUTPUT=$HOST_IP-REXEC
                nmap -v --script rexec-brute -p$PORT_512 $HOST_IP -oN $OUTPUT
            fi
            if [ ! -z "$PORT_513" ]; then
                echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio rlogin  =====${Color_Off}"
                OUTPUT=$HOST_IP-RLOGIN
                nmap -v --script rlogin-brute -p$PORT_513 $HOST_IP -oN $OUTPUT
            fi
            if [ ! -z "$PORT_993" ]; then
                echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio IMAP  =====${Color_Off}"
                OUTPUT=$HOST_IP-IMAP
                nmap -v --script imap-brute -p$PORT_993 $HOST_IP -oN $OUTPUT
            fi
            if [ ! -z "$PORT_1521" ]; then
                echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio ORACLE  =====${Color_Off}"
                OUTPUT=$HOST_IP-ORACLE
                nmap -v --script oracle-brute -p$PORT_1521 $HOST_IP -oN $OUTPUT
            fi
            if [ ! -z "$PORT_3306" ]; then
                echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio MySQL  =====${Color_Off}"
                OUTPUT=$HOST_IP-MYSQL
                nmap -v --script mysql-brute -p$PORT_3306 $HOST_IP -oN $OUTPUT
            fi
            if [ ! -z "$PORT_5900" ]; then
                echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio VNC  =====${Color_Off}"
                OUTPUT=$HOST_IP-VNC
                nmap -v --script vnc-brute -p$PORT_5900 $HOST_IP -oN $OUTPUT
            fi
            if [ ! -z "$PORT_5901" ]; then
                echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio VNC  =====${Color_Off}"
                OUTPUT=$HOST_IP-VNC
                nmap -v --script vnc-brute -p$PORT_5901 $HOST_IP -oN $OUTPUT
            fi
            if [ ! -z "$PORT_6667" ]; then
                echo -e "\n${On_Blue}${BWhite}=====  Brute Force al servicio IRC  =====${Color_Off}"
                OUTPUT=$HOST_IP-IRC
                nmap -v --script irc-brute -p$PORT_6667 $HOST_IP -oN $OUTPUT
            fi
            tput cnorm
        else
            echo -e "\n${Cyan}[${BRed}✘${Cyan}] ${BRed}Debe especificar un servicio.${Color_Off}\n"
            sleep 5; clear
            banner; helpPanel
        fi
    else
        banner
        helpPanel
    fi
fi