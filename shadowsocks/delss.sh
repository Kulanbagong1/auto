#!/bin/bash
# Wa  : +6283160045408
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/shadowsocks-libev/akun.conf")
    if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
    echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "\E[46;1;46m    🔰 HAPUS AKUN SS-LIBEV 🔰     \E[0m"
    echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo ""
    echo "You have no existing clients!"
    echo ""
    echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "\E[46;1;46m    🔰LUXURY EDITION ZEROSSL🔰    \E[0m"
    echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    read -n 1 -s -r -p "Tekan Bebas Untuk Ke Menu"            
    ssmenu
    fi
    clear
    echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "\E[46;1;46m    🔰 HAPUS AKUN SS-LIBEV 🔰     \E[0m"
    echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo "     No  User    Expired "
    echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "\E[46;1;46m    🔰LUXURY EDITION ZEROSSL🔰    \E[0m"
    echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    grep -E "^### " "/etc/shadowsocks-libev/akun.conf" | cut -d ' ' -f 2-3 | nl -s ') '
    echo -e "     0) Cancel"
    echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "\E[46;1;46m    🔰LUXURY EDITION ZEROSSL🔰    \E[0m"
    echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

    until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
    if [[ ${CLIENT_NUMBER} == '1' ]]; then
    read -rp "Select one client [1]: " CLIENT_NUMBER
    elif [[ ${CLIENT_NUMBER} == '0' ]]; then
    ssmenu
    else
    read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
    fi
    done
	# match the selected number to a client name
	CLIENT_NAME=$(grep -E "^### " "/etc/shadowsocks-libev/akun.conf" | cut -d ' ' -f 2-3 | sed -n "${CLIENT_NUMBER}"p)
	user=$(grep -E "^### " "/etc/shadowsocks-libev/akun.conf" | cut -d ' ' -f2 | sed -n "${CLIENT_NUMBER}"p)
	exp=$(grep -E "^### " "/etc/shadowsocks-libev/akun.conf" | cut -d ' ' -f3 | sed -n "${CLIENT_NUMBER}"p)

	# remove [Peer] block matching $CLIENT_NAME
	sed -i "/^### $user $exp/,/^port_http/d" "/etc/shadowsocks-libev/akun.conf"
	# remove generated client file
        systemctl disable shadowsocks-libev-server@$user-tls.service > /dev/null 2>&1
	systemctl disable shadowsocks-libev-server@$user-http.service > /dev/null 2>&1
	systemctl stop shadowsocks-libev-server@$user-tls.service > /dev/null 2>&1
	systemctl stop shadowsocks-libev-server@$user-http.service > /dev/null 2>&1
	rm -f "/etc/shadowsocks-libev/$user-tls.json"
	rm -f "/etc/shadowsocks-libev/$user-http.json"
clear
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[46;1;46m    🔰 HAPUS AKUN SS-LIBEV 🔰     \E[0m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo "✨Nama User ➡️ $user"
echo "✨Kadaluarsa ➡️ $exp"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[46;1;46m    🔰LUXURY EDITION ZEROSSL🔰    \E[0m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -n 1 -s -r -p "Tekan Bebas Untuk Ke Menu"
ssmenu
