#!/usr/bin/env bash
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
echo "!!WARNING!! YOU ARE ABOUT TO WIPE THIS DRIVE, ARE YOU SURE YOU WANT TO CONTINUE (y/n)?"
read PERM

if [[ $PERM == 'n' ]]
then
	clear
	echo "You Have Cancelled The Installation"
	exit
elif [[ $PERM == 'y' ]]
then
else
	clear
	echo "INVALID OPTION. CACELLED"
	exit
fi

echo "yesyyesyesy"
