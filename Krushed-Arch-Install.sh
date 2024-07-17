#!/usr/bin/env bash
# START UP
clear
echo "##################################"
echo "###                            ###"
echo "###    KRUSHED ARCH INSTALL    ###"
echo "###                            ###"
echo "##################################"
echo ""
echo "Loading:"
echo "[*--------------------------------]"

sleep 3
clear

echo "##################################"
echo "###                            ###"
echo "###    KRUSHED ARCH INSTALL    ###"
echo "###                            ###"
echo "##################################"
echo ""
echo "Loading:"
echo "[******---------------------------]"

sleep 2
clear

echo "##################################"
echo "###                            ###"
echo "###    KRUSHED ARCH INSTALL    ###"
echo "###                            ###"
echo "##################################"
echo ""
echo "Loading:"
echo "[*******************--------------]"

sleep 1
clear

echo "##################################"
echo "###                            ###"
echo "###    KRUSHED ARCH INSTALL    ###"
echo "###                            ###"
echo "##################################"
echo ""
echo "Loading:"
echo "[*******************************--]"

sleep 3
clear

echo "##################################"
echo "###                            ###"
echo "###    KRUSHED ARCH INSTALL    ###"
echo "###                            ###"
echo "##################################"
echo ""
echo "Loading:"
echo "[*********************************]"
echo ""
echo "WELCOME"
sleep 2
echo "Krushed Installer v0.0.3 By Vinal Krush"
sleep 2
clear

cp -f /root/Krushed-Arch-Install/etc/pacman.conf /etc/
pacman -Sy
loadkeys us
timedatectl
clear

echo "Please enter a system name:"
read SYSNAME
clear

echo "Please enter a username:"
read USER
clear

echo "Please enter a password: (Password Is Hidden)"
read -s PASSWORD
clear

echo "Please enter a root password: (Leave blank to disable root) (Password Is Hidden)"
read -s ROOTPASSWORD
clear

lsblk
echo "Please enter the drive you want to install linux on: (Example: /dev/nvme0n1 or /dev/sda)"
read SYSDRIVE
clear

echo "Please choose CPU platform"
echo "1. AMD"
echo "2. INTEL"
read CPUPLAT
clear

#echo "How many threads does your cpu have? (This is for compiling packages so it won't take 5 years"
#echo "NUMBERS ONLY"
#read CPUTHREAD
#clear

#echo "Would you like to pre-install BetterFox? (y/n)"
#read BETTERFOX
#clear

# DISK SETUP
echo "####################################"
echo "###                              ###"
echo "###          DISK SETUP          ###"
echo "###                              ###"
echo "####################################"
sleep 1
echo "It is recommended to partition your disk like this or else the installer may format the partitions wrong"
echo ""
echo ""
echo "sda1 - FAT32	- BOOT"
echo "sda2 - SWAP	- SWAP"
echo "sda3 - EXT4	- ROOT"
echo "sda4 - EXT4	- HOME"
sleep 2
echo ""
echo "Press Enter To Continue (Note This Will Wipe Your Drive) Or Press CTRL + C To Cancel"
read ENTER
clear
wipefs -a ${SYSDRIVE}
sleep 1
clear
cfdisk ${SYSDRIVE}
clear

sleep .2
lsblk
echo "Please Define The Boot Partiion (Example /dev/sda1 or /dev/nvme0n1p1)"
read BOOT
clear

sleep .2
lsblk
echo "Please Define The Swap Partition (Example /dev/sda2 or /dev/nvme0n1p2)"
read SWAP
clear

sleep .2
lsblk
echo "Please Define The Root Partition (Example /dev/sda3 or /dev/nvme0n1p3)"
read ROOT
clear

sleep .2
lsblk
echo "Please Define The Home Partition (Example /dev/sda4 or /dev/nvme0n1p4)"
read HOME
clear

sleep 1
echo "####################################"
echo "###                              ###"
echo "###          FORMATTING          ###"
echo "###                              ###"
echo "####################################"
echo ""
echo "Loading:"
echo "[*********************************]"
echo "This May Take A Moment"
echo ""
echo ""
echo ""
echo ""
mkfs.vfat -n BOOT -F 32 "${BOOT}"

clear
echo "####################################"
echo "###                              ###"
echo "###          FORMATTING          ###"
echo "###                              ###"
echo "####################################"
echo ""
echo "Loading:"
echo "[########*************************]"
echo "This May Take A Moment"
echo ""
echo ""
echo ""
echo ""
mkswap -L Swap "${SWAP}"
swapon "${SWAP}"
swapon -a

clear
echo "####################################"
echo "###                              ###"
echo "###          FORMATTING          ###"
echo "###                              ###"
echo "####################################"
echo ""
echo "Loading:"
echo "[################*****************]"
echo "This May Take A Moment"
echo ""
echo ""
echo ""
echo ""
mkfs.ext4 -L "${SYSNAME}"-Root "${ROOT}"

clear
echo "####################################"
echo "###                              ###"
echo "###          FORMATTING          ###"
echo "###                              ###"
echo "####################################"
echo ""
echo "Loading:"
echo "[########################*********]"
echo "This May Take A Moment"
echo ""
echo ""
echo ""
echo ""
mkfs.ext4 -L "${SYSNAME}"-Home "${HOME}"

clear
echo "####################################"
echo "###                              ###"
echo "###          FORMATTING          ###"
echo "###                              ###"
echo "####################################"
echo ""
echo "Loading:"
echo "[#################################]"
echo "This May Take A Moment"
echo ""
echo ""
echo ""
echo ""

mount --mkdir "${ROOT}" /mnt
clear
echo "####################################"
echo "###                              ###"
echo "###            MOUNTING          ###"
echo "###                              ###"
echo "####################################"
echo ""
echo "Loading:"
echo "[///////////######################]"
echo "This May Take A Moment"
echo ""
echo ""
echo ""
echo ""

mount --mkdir "${BOOT}" /mnt/boot/efi
clear
echo "####################################"
echo "###                              ###"
echo "###            MOUNTING          ###"
echo "###                              ###"
echo "####################################"
echo ""
echo "Loading:"
echo "[//////////////////////###########]"
echo "This May Take A Moment"
echo ""
echo ""
echo ""
echo ""

mount --mkdir "${HOME}" /mnt/home
clear
echo "####################################"
echo "###                              ###"
echo "###            MOUNTING          ###"
echo "###                              ###"
echo "####################################"
echo ""
echo "Loading:"
echo "[/////////////////////////////////]"
echo "Done! Please Wait!"
echo ""
echo ""
echo ""
echo ""
sleep 2
clear

# Select Kernel & Drivers
echo "Please Select Kernel (LTS Kernel Not Avalible)"
echo "1. Linux"
echo "2. Linux Zen"
echo "3. Linux Hardened"
read KERN
clear

# Display Drivers
echo "Please Select Display Drivers"
echo "1. NVIDIA"
echo "2. INTEL"
echo "3. AMD"
echo "4. NONE (Software Rendering)"
read DPD
clear

# Last Step
echo "LAST STEP!"
echo "Do You Want This To Be A Minimal Krushed Install? (y/n)"
read KRUSHED
clear

echo "-------------------------------------------------------------------------"
echo "---                                                                   ---"
echo "---                                                                   ---"
echo "---        INSTALLING ARCH LINUX FOR "${USER}" ON "${SYSNAME}"        ---"
echo "---                                                                   ---"
echo "---                                                                   ---"
echo "-------------------------------------------------------------------------"
sleep 2

clear
echo "-----------------------------------------------------------------------------------------------------"
echo "---                                                                                               ---"
echo "---                                                                                               ---"
echo "---                                       KRUSHED INSTALLER                                       ---"
echo "---                                                                                               ---"
echo "---                                                                                               ---"
echo "---                                              10%                                              ---"
echo "-----------------------------------------------------------------------------------------------------"
echo ""
echo "|@@@@@@@@@@------------------------------------------------------------------------------------------|"
sleep 5
clear

pacstrap -K /mnt base base-devel
sleep 2
clear

echo "-------------------------------------------------------------------------"
echo "---                                                                   ---"
echo "---                                                                   ---"
echo "---                        INSTALLING KERNEL                          ---"
echo "---                                                                   ---"
echo "---                                                                   ---"
echo "-------------------------------------------------------------------------"

if [[ $KERN == '1' ]]
then
	pacstrap -K /mnt linux linux-firmware linux-headers
elif [[ $KERN == '2' ]]
then
	pacstrap -K /mnt linux-zen linux-firmware linux-headers
elif [[ $KERN == '3' ]]
then
	pacstrap -K  /mnt linux-hardened linux-firmware linux-headers
fi
cp -f /root/Krushed-Arch-Install/etc/pacman.conf /mnt/etc/
cp -f /root/Krushed-Arch-Install/etc/mkinitcpio.conf /mnt/etc/
cp -f /root/Krushed-Arch-Install/etc/makepkg.conf /mnt/etc/

sleep 2
clear

clear
echo "-----------------------------------------------------------------------------------------------------"
echo "---                                                                                               ---"
echo "---                                                                                               ---"
echo "---                                       KRUSHED INSTALLER                                       ---"
echo "---                                                                                               ---"
echo "---                                                                                               ---"
echo "---                                              20%                                              ---"
echo "-----------------------------------------------------------------------------------------------------"
echo ""
echo "|@@@@@@@@@@@@@@@@@@@@--------------------------------------------------------------------------------|"
sleep 5
clear

echo "-------------------------------------------------------------------------"
echo "---                                                                   ---"
echo "---                                                                   ---"
echo "---                     INSTALLING DISPLAY DRIVERS                    ---"
echo "---                                                                   ---"
echo "---                                                                   ---"
echo "-------------------------------------------------------------------------"
sleep 2

if [[ $DPD == '1' ]]
# Nvidia Drivers
then
	pacstrap -K /mnt nvidia-dkms nvidia nvidia-utils lib32-nvidia-utils

elif [[ $DPD == '2' ]]
# Intel Drivers
then 
	pacstrap -K /mnt mesa lib32-mesa vulkan-intel lib32-vulkan-intel

elif [[ $DPD == '3' ]]
# AMD Drivers
then
	pacstrap -K /mnt mesa lib32-mesa xf86-video-amdgpu vulkan-radeon libva-mesa-driver lib32-libva-mesa-driver mesa-vdpau lib32-mesa-vdpau

elif [[ $DPD == '4' ]]
# Skipping Display Driver Install
then
	echo "No Driver Selected"
	echo "Skipping..."
	sleep 3
fi
sleep 2
clear

clear
echo "-----------------------------------------------------------------------------------------------------"
echo "---                                                                                               ---"
echo "---                                                                                               ---"
echo "---                                       KRUSHED INSTALLER                                       ---"
echo "---                                                                                               ---"
echo "---                                                                                               ---"
echo "---                                              30%                                              ---"
echo "-----------------------------------------------------------------------------------------------------"
echo ""
echo "|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@----------------------------------------------------------------------|"
sleep 5
clear

echo "-------------------------------------------------------------------------"
echo "---                                                                   ---"
echo "---                                                                   ---"
echo "---                      INSTALLING BASE SYSTEM                       ---"
echo "---                                                                   ---"
echo "---                                                                   ---"
echo "-------------------------------------------------------------------------"
sleep 2

pacstrap -K /mnt grub os-prober efibootmgr vim git xorg xorg-server openssh wayland dhclient networkmanager

# Installing UCODE
if [[ $CPUPLAT == '1' ]]
then
	pacstrap -K /mnt amd-ucode
elif [[ $CPUPLAT == '2' ]]
then
	pacstrap -K /mnt intel-ucode
fi

sleep 2


genfstab -U /mnt >> /mnt/etc/fstab
clear

# Base System Setup

cp -f ./etc/pacman.conf /mnt/etc/pacman.conf
cp -f ./etc/mkinitcpio.conf /mnt/etc/mkinitcpio.conf

mkdir -p /mnt/home/$USER/Krushed-Installer
touch /mnt/home/$USER/Krushed-Installer/THANK YOU FOR USING KRUSHED INSTALLER
touch /mnt/home/$USER/Krushed-Installer/IT IS SAFE TO DELETE THIS FOLDER

cat <<REALEND > /mnt/home/$USER/Krushed-Installer/krushed-installer.sh
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

clear
echo "-----------------------------------------------------------------------------------------------------"
echo "---                                                                                               ---"
echo "---                                                                                               ---"
echo "---                                       KRUSHED INSTALLER                                       ---"
echo "---                                                                                               ---"
echo "---                                                                                               ---"
echo "---                                              40%                                              ---"
echo "-----------------------------------------------------------------------------------------------------"
echo ""
echo "|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@------------------------------------------------------------|"
sleep 5
clear

cat <<REALEND > /mnt/home/$USER/Krushed-Installer/user-installs.sh
# I'm not typing or copying this again. look in krushed-installer.sh for context
#
#
# Don't touch or run this code or you might brick your system
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
echo "---                                              50%                                              ---"
echo "-----------------------------------------------------------------------------------------------------"
echo ""
echo "|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--------------------------------------------------|"
sleep 5
clear

yay -Syu --needed --noconfirm pipewire lib32-pipewire wireplumber pipewire-audio pipewire-alsa pipewire-pulse pipewire-jack lib32-pipewire-jack fastfetch firefox git zsh vim ldns noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-hack-nerd wget curl xclip ark konsole unzip unrar steam lutris gparted gnome-disk-utility gvfs gvfs-afc bpytop os-prober grub-customizer flatpak dpkg jre-openjdk jre8-openjdk jre11-openjdk jre17-openjdk jre21-openjdk less qpwgraph gnome-calculator fzf fuse3 fuse2 alsa-utils btrfs-progs exfat-utils ntfs-3g ufw lib32-vkd3d totem lightdm web-greeter plasma vesktop mkinitcpio-randommac mkinitcpio-archlogo mkinitcpio-numlock mkinitcpio-firmware libreoffice-fresh dolphin numlockx kvantum ocs-url qemu libvirt edk2-ovmf virt-manager ebtables dnsmasq

yay -Rns --needed --noconfirm sddm sddm-kcm


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

#Grub
# AMD
if [[ $CPUPLAT == '1']]
then
	sudo sed -i 's/^GRUB_CMDLINE_DEFAULT="loglevel=3 quiet"/GRUB_CMDLINE_DEFAULT="initrd=\amd-ucode amd_pstate=active quiet loglevel=1 nowatchdog usbcore.autosuspend=-1 audit=0 pcie_aspm=off video=efifb:auto mitigations=off nvidia-drm.modeset=1"/' /etc/default/grub
# Nvidia
elif [[ $CPUPLAT == '2']]
then
	sudo sed -i 's/^GRUB_CMDLINE_DEFAULT="loglevel=3 quiet"/GRUB_CMDLINE_DEFAULT="initrd=\intel-ucode intel_pstate=active quiet loglevel=1 nowatchdog usbcore.autosuspend=-1 audit=0 pcie_aspm=off video=efifb:auto mitigations=off nvidia-drm.modeset=1"/' /etc/default/grub
fi

sudo sed -i 's/^#GRUB_DISABLE_OS_PROBER=false/GRUB_DISABLE_OS_PROBER=false/'

sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=${SYSNAME}-Grub-Manager

sudo grub-mkconfig -o /boot/grub/grub.cfg

# LightDM
#
clear
echo "-----------------------------------------------------------------------------------------------------"
echo "---                                                                                               ---"
echo "---                                                                                               ---"
echo "---                                       KRUSHED INSTALLER                                       ---"
echo "---                                                                                               ---"
echo "---                                                                                               ---"
echo "---                                              70%                                              ---"
echo "-----------------------------------------------------------------------------------------------------"
echo ""
echo "|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-----------------------------------|"
sleep 5
clear

sudo sed -i 's/^#greeter-session=example-gtk-gnome/greeter-session=web-greeter/'

#sudo sed -i 's/^#greeter-setup-script=/greeter-setup-script/usr/bin/numlockx on/'

clear
echo "-----------------------------------------------------------------------------------------------------"
echo "---                                                                                               ---"
echo "---                                                                                               ---"
echo "---                                       KRUSHED INSTALLER                                       ---"
echo "---                                                                                               ---"
echo "---                                                                                               ---"
echo "---                                              80%                                              ---"
echo "-----------------------------------------------------------------------------------------------------"
echo ""
echo "|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@----------|"
sleep 5
clear

echo "INSTALLING ZSH"
echo "DO NOT SET ZSH AS DEFAULT TERMINAL"
echo "WHEN YOU ENTER ZSH, TYPE EXIT"
echo "PRESS ENTER IF YOU UNDERSTAND"
read UNDRSTAND
sleep 2
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

clear
echo "-----------------------------------------------------------------------------------------------------"
echo "---                                                                                               ---"
echo "---                                                                                               ---"
echo "---                                       KRUSHED INSTALLER                                       ---"
echo "---                                                                                               ---"
echo "---                                                                                               ---"
echo "---                                              90%                                              ---"
echo "-----------------------------------------------------------------------------------------------------"
echo ""
echo "|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-----|"
sleep 5
clear

sudo systemctl enable bluetooth.service libvirtd.service virtlogd.socket lightdm.service

if [[ $DPD == '1']]
then
	sudo systemctl enable nvidia-resume.service
fi

sudo systemctl restart libvirtd
sudo systemctl enable libvirtd

sudo virsh net-autostart default
sudo virsh net-start default
exit
REALEND

su $USER -c /mnt/home/$USER/Krushed-Installer/user-installs.sh
exit

arch-chroot /mnt sh /mnt/home/$USER/Krushed-Installer/krushed-installer.sh

cp -f ./home/user/.zshrc /mnt/home/$USER/

clear
echo "-----------------------------------------------------------------------------------------------------"
echo "---                                                                                               ---"
echo "---                                                                                               ---"
echo "---                                       KRUSHED INSTALLER                                       ---"
echo "---                                                                                               ---"
echo "---                                                                                               ---"
echo "---                                             100%                                              ---"
echo "-----------------------------------------------------------------------------------------------------"
echo ""
echo "|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|"
echo "INSTALL COMPLETE"
sleep 10
clear

echo "The install process is complete."
echo "Would you like to exit now? (y/n)"
read REBOOTSYS
if [[ $REBOOTSYS == 'y']]
then
	clear
	echo "Unplug the Arch ISO USB, and press ENTER"
	read GOODTOREBOOT
	reboot now
elif [[ $REBOOTSYS == 'n']]
	clear
	echo "Install Complete"
	echo "Feel Free To Restart Whenever You Like"
fi
