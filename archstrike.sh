#!/bin/bash
#makes system remember Sudo password for a few minutes
sudo pwd
sudo sh -c "echo -e '[archstrike]\nServer = https://mirror.archstrike.org/\$arch/\$repo' >> /etc/pacman.conf"
sudo pacman-key --init 
sudo dirmngr < /dev/null
sudo pacman-key -r 9D5F1C051D146843CDA4858BDE64825E7CBC0D51
sudo pacman-key --lsign-key 9D5F1C051D146843CDA4858BDE64825E7CBC0D51
sudo pacman -Syy
sudo pacman -Sl archstrike
echo "Script has finished adding the repos, arch strike is in your mirrors, proof ^^^^^"
while true; do
	read -p "Do you want to install all pentesting tools? [Y/n]" yn 
	case $yn in
		[Yy]* ) sudo pacman -S metasploit dirb dirbuster gobuster nmap masscan openvpn nikto sqlmap aircrack-ng hydra john tmux netcat wireshark-qt hashcat macchanger firefox neofetch gtop scrot samdump2; break;;
		[Nn]* ) exit;;
		* ) echo "[Y/n]";;
	esac
done
echo "Installtion finished. Good luck"
neofetch | grep "Packages"
while true; do
	read -p "Would you like to add yaourt to your system?? [Y/n]" ynn
	case $ynn in
		[Yy]* ) sudo pacman -S git wget yajl;
		git clone https://aur.archlinux.org/package-query.git
		cd package-query
		makepkg -si
		cd ..
		git clone https://aur.archlinux.org/yaourt.git
		cd yaourt/
		makepkg -si
		cd ../
		sudo rm -dR yaourt/ package-query/
		 break;;
		[Nn]* ) exit;;
		* ) echo "[Y/n]";;
	esac
done
