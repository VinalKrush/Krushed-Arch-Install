# Installing Selected Kernel

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

if [[ $KERN == '1']]
then
	pacstrap -K /mnt linux linux-firmware linux-headers
elif [[ $KERN == '2']]
then
	pacstrap -K /mnt linux-zen linux-firmware linux-headers
elif [[ $KERN == '3']]
then
	pacstrap -K /mnt linux-hardened linux-firmware linux-headers
elif [[ $KERN == '4']]
then
	pacstrap -K /mnt linux-lts linux-firmware linux-headers
fi
