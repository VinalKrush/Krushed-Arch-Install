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
cd
clear
loadkeys us
pacman -Syu
clear
hwclock --systohc
sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8' /etc/locale.gen
locale-gen
echo "LANG=en=US.UTF-8" >> /etc/locale.conf
echo "${SYSNAME}" > /etc/hostname
touch /etc/vconsole.conf
echo "KEYMAP=us" > /etc/vconsole.conf
clear

cat <<EOF > /etc/hosts
127.0.0.1	localhost
::1		localhost
127.0.1.1	${SYSNAME}.localdomain	${SYSNAME}
EOF
clear

mkinitcpio -P
clear
echo root:$ROOTPASSWORD | chpasswd
useradd -m -G wheel,storage,power,audo $USER
echo $USER:$PASSWORD | chpasswd
ln -s /usr/bin/vim /usr/bin/vi
systemctl enable NetworkManager.service sshd.service
cd /home/${USER}
chown -R $USER:$USER /home/$USER
clear
cd

su $USER -c /mnt/home/$USER/Krushed-Installer/user-installs.sh

clear
git clone https://aur.archlinux.org/yay
cd yay
makepkg -si --noconfirm
cd
sudo rm -rf yay

if [[ $BETTERFOX == 'y']]
then
	git clone https://github.com/yokoffing/Betterfox.git
elif [[ $BETTERFOX == 'n']]
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
echo "---                                              55%                                              ---"
echo "-----------------------------------------------------------------------------------------------------"
echo ""
echo "|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@---------------------------------------------|"
sleep 5
clear

yay -Syu --needed --noconfirm pipewire lib32-pipewire wireplumber pipewire-audio pipewire-alsa pipewire-pulse pipewire-jack lib32-pipewire-jack fastfetch firefox git zsh vim ldns noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-hack-nerd wget curl xclip ark konsole unzip unrar steam lutris gparted gnome-disk-utility gvfs gvfs-afc bpytop os-prober grub-customizer flatpak dpkg jre-openjdk jre8-openjdk jre11-openjdk jre17-openjdk jre21-openjdk less qpwgraph gnome-calculator fzf fuse3 fuse2 alsa-utils btrfs-progs exfat-utils ntfs-3g ufw lib32-vkd3d totem lightdm web-greeter plasma vesktop mkinitcpio-randommac mkinitcpio-archlogo mkinitcpio-numlock mkinitcpio-firmware libreoffice-fresh dolphin numlockx kvantum ocs-url qemu libvirt edk2-ovmf virt-manager ebtables dnsmasq
