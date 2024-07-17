#!/usr/bin/env bash
# START UP
PATH=${PWD}
clear
echo "##################################"
echo "###                            ###"
echo "###    KRUSHED ARCH INSTALL    ###"
echo "###                            ###"
echo "##################################"
echo ""
echo "Loading:"
echo "[*--------------------------------]"

mkdir $PATH/.tpm/

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

touch $PATH/.tmp/.install.json

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

cp -f $PATH/src/R/etc/pacman.conf /etc/
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
echo "Please Enter The Drive You Want To Install Linux On: (Example: nvme0n1 or sda)"
echo "DO NOT INCLUDE /dev/"
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
wipefs -a /dev/${SYSDRIVE}
sleep 1
clear
cfdisk /dev/${SYSDRIVE}
clear

sleep .2
lsblk
echo "Please Define The Boot Partiion (Example sda1 or nvme0n1p1)"
echo "DO NOT INCLUDE /dev/"
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

chmod +x $PATH/src/kernels/kernel.sh
$PATH/src/kernels/kernel.sh



cp -f $PATH/src/R/etc/ /mnt/etc/
cp -f $PATH/src/R/sudoers /mnt/etc

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

chmod +x $PATH/src/dpd/dpd.sh
$PATH/src/dpd/dpd.sh

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

chmod +x $PATH/src/packages/base-pkg.sh
$PATH/src/packages/base-pkg.sh

sleep 2


genfstab -U /mnt >> /mnt/etc/fstab
clear

# Base System Setup
mkdir -p /mnt/home/$USER/Krushed-Installer
touch /mnt/home/$USER/Krushed-Installer/THANK YOU FOR USING KRUSHED INSTALLER
touch /mnt/home/$USER/Krushed-Installer/IT IS SAFE TO DELETE THIS FOLDER
cp -f $PATH/src/base-install.sh /mnt/home/$USER/Krushed-Installer
cp -f $PATH/src/krushed-install.sh /mnt/home/$USER/Krushed-Installer
chmod +x /mnt/home/$USER/Krushed-Installer/base-install.sh
chmod +x /mnt/home/$USER/Krushed-Installer/krushed-install.sh
MIRROR="us"
cp -f $PATH/mirrors/${MIRROR}/mirrorlist /mnt/etc/pacman.d/

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

arch-chroot /mnt bash /mnt/home/$USER/Krushed-Installer/base-install.sh

cp -f $PATH/home/user/.zshrc /mnt/home/$USER/

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
