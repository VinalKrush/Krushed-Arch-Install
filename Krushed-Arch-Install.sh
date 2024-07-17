#!/usr/bin/env bash
# START UP
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

sleep 7
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
sleep 5
echo "Krushed Installer v0.0.1 By Vinal Krush"
sleep 5
clear

sed -i 's/^#ParallelDownloads = 5/ParallelDownloads = 20/' /etc/pacman.conf
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

echo "Please enter a password:"
read PASSWORD
clear

echo "Please enter a root password: (Leave blank to disable root)"
read ROOTPASSWORD
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
exit
# DISK SETUP
