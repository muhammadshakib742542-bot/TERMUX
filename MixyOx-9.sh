#!/usr/bin/bash

clear
echo -e "\e[1;31m"
figlet -f standard "MixyOx-9"
echo -e "\e[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo -e "\e[1;32m      [+] Termux Theme Setup Tool [+]\e[0m"
echo -e "\e[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo ""

read -p $'\e[1;93m [?] Enter Your Hacker Alias / Username : \e[1;96m' user
echo ""
echo -e "\e[1;32m [*] Hello $user, Injecting your theme...\e[0m"
echo -e "\e[1;33m [*] Please Wait, fetching dependencies...\e[0m"
echo ""

# Installing required packages
apt update -y && apt upgrade -y 
pkg install figlet python python2 ncurses-utils ruby git -y
pip install pyfiglet termcolor
gem install lolcat 

clear
figlet -f small "Setting Up" | lolcat
echo -e "\e[1;36m [+] Configuring System Files...\e[0m"

# Clone and setup
git clone https://github.com/MixyOx-6/TERMUX

# Replacing MixyZx with user input across all files
sed -i "s/MixyZx/$user/g" TERMUX/bash.bashrc
sed -i "s/MixyZx/$user/g" TERMUX/wlc.py

cp TERMUX/bash.bashrc /data/data/com.termux/files/usr/etc/bash.bashrc
cp TERMUX/wlc.py /data/data/com.termux/files/usr/etc/wlc.py
rm -rf TERMUX simple-edit

clear
figlet -f standard "$user" | lolcat
echo -e "\e[1;32m [✓] Theme Successfully Installed!\e[0m"
echo -e "\e[1;93m [!] Type 'exit' and restart Termux to see the magic.\e[0m"
exit
