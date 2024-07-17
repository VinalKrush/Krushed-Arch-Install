#!/usr/bin/env bash



clear
echo "##################################"
echo "###                            ###"
echo "###    KRUSHED ARCH INSTALL    ###"
echo "###                            ###"
echo "##################################"
echo ""
echo "Loading:"
echo "[*--------------------------------]"

PATHH=${PWD}
echo "Updating Package Lists"	
pacman -Sy --noconfirm
mkdir $PATHH/.tmp/

sleep 1
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

touch $PATHH/.tmp/.install.json
echo "Installing Dependency"				
pacman -S --needed --noconfirm jq
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

sleep 1
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
echo "Krushed Installer v1.0.0 By Vinal Krush"
sleep 2
clear
cd			

cp -f $PATHH/src/R/etc/pacman.conf /etc/
pacman -Sy
loadkeys us
timedatectl
clear

echo "Please Enter A System Name:"
read SYSNAME
clear

echo "Please Enter A Username:"
read USER
clear

echo "Please Enter A Password: (Password Is Hidden)"
read -s PASSWORD
clear

echo "Please Enter A Root Password: (Leave blank to disable root) (Password Is Hidden)"
read -s ROOTPASSWORD
clear

lsblk
echo "Please Enter The Drive You Want To Install Linux On: (Example: /dev/nvme0n1 or /dev/sda)"
read SYSDRIVE
clear

echo "Please Choose CPU Platform"
echo "1. AMD"
echo "2. INTEL"
read CPUPLAT
clear

#echo "How many threads does your cpu have? (This is for compiling packages so it won't take 5 years"
#echo "NUMBERS ONLY"
#read CPUTHREAD
#clear

echo "Would You Like To Pre-Install BetterFox? (y/n)"
read BETTERFOX
clear

# Select Kernel & Drivers
echo "Please Select Kernel"
echo "1. Linux"
echo "2. Linux Zen"
echo "3. Linux Hardened"
echo "4. Linux LTS"
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

echo "What Type Of Install Should This Be"
echo "1. Krushed Install"
echo "2. Minimal"
read KRUSHED
clear

# Making Tmp File For Other .sh
install_json=$(cat <<EOF
	{
	    "SYSNAME": "${SYSNAME}",
	    "USER": "${USER}",
		"PASSWORD": "${PASSWORD}",
		"ROOTPASSWORD": "${ROOTPASSWORD}",
    	"SYSDRIVE": "${SYSDRIVE}",
    	"CPUPLAT": "${CPUPLAT}",
    	"BETTERFOX": "${BETTERFOX}",
    	"KERN": "${KERN}",
    	"DPD": "${DPD}",
    	"KRUSHED": "${KRUSHED}",
		"PATHH": "${PATHH}",
		"INSTALLER_PATH": "/.Krushed-Installer/"
	}
EOF
)

echo $install_json >> $PATHH/.tmp/.install.json
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

pacstrap -K /mnt base base-devel jq
mkdir -p /mnt/.Krushed-Installer/
cp -f $PATHH/.tmp/.install.json /mnt/.Krushed-Installer/
cp -f $PATHH/src/lightdm /mnt/.Krushed-Installer/
sleep 2
clear

echo "-------------------------------------------------------------------------"
echo "---                                                                   ---"
echo "---                                                                   ---"
echo "---                        INSTALLING KERNEL                          ---"
echo "---                                                                   ---"
echo "---                                                                   ---"
echo "-------------------------------------------------------------------------"

chmod +x $PATHH/src/kernels/kernel.sh
$PATHH/src/kernels/kernel.sh


chmod +rwx $PATHH/src/R/etc/sudoers

cp -f $PATHH/src/R/etc/ /mnt/etc/

chmod -wx /mnt/etc/sudoers

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

chmod +x $PATHH/src/dpd/dpd.sh
$PATHH/src/dpd/dpd.sh

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

chmod +x $PATHH/src/packages/base-pkg.sh
$PATHH/src/packages/base-pkg.sh

sleep 2


genfstab -U /mnt >> /mnt/etc/fstab
clear

# Base System Setup
touch /mnt/.Krushed-Installer/THANK YOU FOR USING KRUSHED INSTALLER
touch /mnt/.Krushed-Installer/IT IS SAFE TO DELETE THIS FOLDER
cp -f $PATHH/src/base-install.sh /mnt/.Krushed-Installer/
cp -f $PATHH/src/krushed-install.sh /mnt/.Krushed-Installer/
cp -f $PATHH/src/user-install.sh /mnt/.Krushed-Installer/
cp -f $PATHH/src/lightdm /mnt/.Krushed-Installer/
chmod +x /mnt/.Krushed-Installer/base-install.sh
chmod +x /mnt/.Krushed-Installer/krushed-install.sh
chmod +x /mnt/.Krushed-Installer/user-install.sh
MIRROR="us"
cp -f $PATHH/mirrors/${MIRROR}/mirrorlist /mnt/etc/pacman.d/

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

arch-chroot /mnt bash /mnt/.Krushed-Installer/base-install.sh

cp -f $PATHH/home/user/.zshrc /mnt/home/$USER/

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
echo "Would you like to reboot now? (y/n)"
read REBOOTSYS
if [[ $REBOOTSYS == 'y']]
then
	clear
	echo "Unplug the Arch ISO USB, and press ENTER"
	read GOODTOREBOOT
	swapoff -A
	umount -R /mnt
	reboot now
elif [[ $REBOOTSYS == 'n']]
then
	clear
	echo "Install Complete"
	echo "Feel Free To Restart Whenever You Like"
	arch-chroot /mnt bash su ${USER}
fi
