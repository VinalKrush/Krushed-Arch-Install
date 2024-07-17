# Installing Selected Kernel

SYSNAME= jq .SYSNAME /mnt/.Krushed-Installer/.install.json
USER= jq .USER /mnt/.Krushed-Installer/.install.json
PASSWORD= jq .PASSWORD /mnt/.Krushed-Installer/.install.json
ROOTPASSWORD= jq .ROOTPASSWORD /mnt/.Krushed-Installer/.install.json
SYSDRIVE= jq .SYSDRIVE /mnt/.Krushed-Installer/.install.json
CPUPLAT= jq .CPUPLAT /mnt/.Krushed-Installer/.install.json
BETTERFOX= jq .BETTERFOX /mnt/.Krushed-Installer/.install.json
KERN= jq .KERN /mnt/.Krushed-Installer/.install.json
DPD= jq .DPD /mnt/.Krushed-Installer/.install.json
KRUSHED= jq .KRUSHED /mnt/.Krushed-Installer/.install.json
PATHH= jq .PATHH /mnt/.Krushed-Installer/.install.json
INSTALLER_PATH= jq .INSTALLER_PATH /mnt/.Krushed-Installer/.install.json
clear


if [[ $KERN == '2' ]]
then
	pacstrap -K /mnt linux-zen linux-firmware linux-headers

elif [[ $KERN == '3' ]]
then
	pacstrap -K /mnt linux-hardened linux-firmware linux-headers

elif [[ $KERN == '4' ]]
then
	pacstrap -K /mnt linux-lts linux-firmware linux-headers

else
	pacstrap -K /mnt linux linux-firmware linux-headers
fi
