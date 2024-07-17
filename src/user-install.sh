##############################################################
##############################################################
# THANK YOU FOR USING THE KRUSHED ARCH INSTALLER
#
# THIS IS A SECONDARY FILE NEEDED DURING THE INSTALL PROCESS
# IF YOU ARE READING THIS... then you are most likely done
# it is safe to delete this folder and everything inside.
#
#
#
# Running this code most likely will do nothing
# but still don't unless you just wanna lose your system

SYSNAME= jq -r .SYSNAME /mnt/.Krushed-Installer/.install.json
USER= jq -r .USER /mnt/.Krushed-Installer/.install.json
PASSWORD= jq -r .PASSWORD /mnt/.Krushed-Installer/.install.json
ROOTPASSWORD= jq -r .ROOTPASSWORD /mnt/.Krushed-Installer/.install.json
SYSDRIVE= jq -r .SYSDRIVE /mnt/.Krushed-Installer/.install.json
CPUPLAT= jq -r .CPUPLAT /mnt/.Krushed-Installer/.install.json
BETTERFOX= jq -r .BETTERFOX /mnt/.Krushed-Installer/.install.json
KERN= jq -r .KERN /mnt/.Krushed-Installer/.install.json
DPD= jq -r .DPD /mnt/.Krushed-Installer/.install.json
KRUSHED= jq -r .KRUSHED /mnt/.Krushed-Installer/.install.json
PATHH= jq -r .PATHH /mnt/.Krushed-Installer/.install.json
INSTALLER_PATH= jq -r .INSTALLER_PATH /mnt/.Krushed-Installer/.install.json
clear

clear
git clone https://aur.archlinux.org/yay
cd yay
makepkg -si --noconfirm
cd
sudo rm -rf yay

if [[ $BETTERFOX == 'y' ]]
then
	git clone https://github.com/yokoffing/Betterfox.git
elif [[ $BETTERFOX == 'n' ]]
then
	echo "Not Installing BetterFox"
fi

clear
echo "-----------------------------------------------------------------------------------------------------"
echo "---                                                                                               ---"
echo "---                                                                                               ---"
echo "---                                       KRUSHED INSTALLER                                       ---"
echo "---                                                                                               ---"
echo "---                                                                                               ---"
echo "---                                              60%                                              ---"
echo "-----------------------------------------------------------------------------------------------------"
echo ""
echo "|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@----------------------------------------|"
sleep 5
clear

yay -Syu --needed --noconfirm pipewire lib32-pipewire wireplumber pipewire-audio pipewire-alsa pipewire-pulse pipewire-jack lib32-pipewire-jack fastfetch firefox git zsh vim ldns noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-hack-nerd wget curl xclip unzip unrar gparted gnome-disk-utility gvfs gvfs-afc bpytop os-prober grub-customizer less qpwgraph fuse3 fuse2 alsa-utils btrfs-progs exfat-utils ntfs-3g mkinitcpio-randommac mkinitcpio-archlogo mkinitcpio-numlock mkinitcpio-firmware numlockx qemu libvirt edk2-ovmf virt-manager ebtables dnsmasq

# Krushed Packages
# ark konsole steam lutris flatpak dpkg jre-openjdk jre8-openjdk jre11-openjdk jre17-openjdk jre21-openjdk gnome-calculator fzf ufw lib32-vkd3d lightdm web-greeter plasma vesktop libreoffice-fresh dolphin kvantum ocs-url qemu libvirt edk2-ovmf virt-manager ebtables dnsmasq

sudo systemctl enable bluetooth.service

if [[ $DPD == '1' ]]
then
	sudo systemctl enable nvidia-resume.service
fi

cd
if [[ $KRUSHED == '1' ]]
then
    /.Krushed-Installer/krushed-install.sh
else
    exit
fi
exit