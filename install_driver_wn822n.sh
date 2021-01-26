#!/bin/bash

RED="\e[0;31m"	  
BLACK="\e[0;30m"  
GREEN="\e[0;32m"   
YELLOW="\e[0;33m"   
BLUE="\e[0;34m"  
MAGEN="\e[0;35m" 
CYAN="\e[0;36m"    
WHITE="\e[0;37m"  

clear
printf "\n\n\n\n\t${GREEN}******* Linux Drivers For TP-LINK WN822N(V5) *******\n"
printf "\n\n\n\n\n\t\t${RED}[+] Enter To Install Drivers..."
read rd1

clear
printf "\n\n\n${GREEN}[x] Installing Requirements... \n\n"
sudo apt-get install git linux-headers-generic build-essential dkms -y;

printf "\n\n\n${BLUE}[#] Cloning rtl8192eu Driver....\n\n"
git clone https://github.com/Mange/rtl8192eu-linux-driver;
cd rtl8192eu-linux-driver;

printf "\n${MAGEN}[*] Current Directory :: $(pwd) \n\n${WHITE}$(ls)\n"
printf "\n\n\n${YELLOW}[+] Enter To Continue...."
read rd2

clear
printf "\n\n\n${GREEN}[*] Building and Installing DKMS... \n\n\n"
sudo dkms add .;
sudo dkms install rtl8192eu/1.0;

echo "blacklist rtl8xxxu" | sudo tee /etc/modprobe.d/rtl8xxxu.conf;
echo -e "8192eu\n\nloop" | sudo tee /etc/modules;
echo "options 8192eu rtw_power_mgnt=0 rtw_enusbss=0" | sudo tee /etc/modprobe.d/8192eu.conf;

printf "\n\n\n\n${YELLOW}[+] Updating Grub & Updating Initramfs [+]\n\n\n"
sudo update-grub; sudo update-initramfs -u;

printf "\n\n\n\n${GREEN}[x] Installation Done !!!\n\n\n"

printf "\n\n\n${YELLOW}[~] Wanna Reboot Now !\n\n"
printf "\n\n\n\t[+] Enter To Continue [CTRL+C] To Cancel...\n\n\n\n"
read rd3

printf "\n\n\n\t${BLUE}[...] Rebooting In [...] ${RED}\t 5 "
sleep 1
printf "\t 4 "
sleep 1
printf "\t 3 "
sleep 1
printf "\t 2 "
sleep 1
printf "\t 1"
sleep 1
sudo systemctl reboot -i;
