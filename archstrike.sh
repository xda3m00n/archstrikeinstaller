#!/bin/bash
#checks if user has root or sudo permissions
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi
#adds archstrike.org mirrors to the repos and then updating and checks for the right code, in the end - it updates it
echo "[archstrike]
Server = https://mirror.archstrike.org/\$arch/\$repo" >> /etc/pacman.conf
pacman-key --init 
dirmngr < /dev/null
pacman-key -r 9D5F1C051D146843CDA4858BDE64825E7CBC0D51
pacman-key --lsign-key 9D5F1C051D146843CDA4858BDE64825E7CBC0D51
pacman -Syy
pacman -Sl archstrike
echo "Script has finished adding the repos, arch strike is in your mirrors, proof ^^^^^"
while true; do
	read -p "Do you want to install all pentesting tools? [Y/n]" yn 
	case $yn in
		[Yy]* ) pacman -S metasploit dirb dirbuster gobuster nmap masscan openvpn nikto sqlmap aircrack-ng hydra john tmux netcat wireshark-qt hashcat macchanger firefox neofetch gtop; break;;
		[Nn]* ) exit;;
		* ) echo "[Y/n]";;
	esac
done
echo "Installtion finished. Good luck"
neofetch | grep "Packages"
