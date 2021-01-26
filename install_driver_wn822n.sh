#!/bin/bash

# Colors +++
RED="\e[0;31m"	    # dark red
BLACK="\e[0;30m"    # dark black
GREEN="\e[0;32m"    # dark green
YELLOW="\e[0;33m"   # dark yellow (brown)
BLUE="\e[0;34m"     # dark blue
MAGEN="\e[0;35m"    # dark magenta
CYAN="\e[0;36m"     # dark cyan
WHITE="\e[0;37m"    # dark white (L.gray)

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

printf "\n\n\n${GREEN}[*]Installing Drivers... \n\n\n"
sudo dkms add .;
sudo dkms install rtl8192eu/1.0;

echo "blacklist rtl8xxxu" | sudo tee /etc/modprobe.d/rtl8xxxu.conf;
echo -e "8192eu\n\nloop" | sudo tee /etc/modules;
echo "options 8192eu rtw_power_mgnt=0 rtw_enusbss=0" | sudo tee /etc/modprobe.d/8192eu.conf;

printf "\n\n\n${YELLOW}[+] Updating Grub & Updating Initramfs [+]\n\n\n"
sudo update-grub; sudo update-initramfs -u;

printf "\n\n\n${GREEN}[x] Installation Done !!!\n"
printf "\n\n\n\t${BLUE}Rebooting In... ${RED}5 "
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
