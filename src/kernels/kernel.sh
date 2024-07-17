# Installing Selected Kernel

SYSNAME= jq .SYSNAME /var/.tmp/.Krushed-Installer/.install.json
USER= jq .USER /var/.tmp/.Krushed-Installer/.install.json
PASSWORD= jq .PASSWORD /var/.tmp/.Krushed-Installer/.install.json
ROOTPASSWORD= jq .ROOTPASSWORD /var/.tmp/.Krushed-Installer/.install.json
SYSDRIVE= jq .SYSDRIVE /var/.tmp/.Krushed-Installer/.install.json
CPUPLAT= jq .CPUPLAT /var/.tmp/.Krushed-Installer/.install.json
BETTERFOX= jq .BETTERFOX /var/.tmp/.Krushed-Installer/.install.json
KERN= jq .KERN /var/.tmp/.Krushed-Installer/.install.json
DPD= jq .DPD /var/.tmp/.Krushed-Installer/.install.json
KRUSHED= jq .KRUSHED /var/.tmp/.Krushed-Installer/.install.json
PATHH= jq .PATHH /var/.tmp/.Krushed-Installer/.install.json
INSTALLER_PATH= jq .INSTALLER_PATH /var/.tmp/.Krushed-Installer/.install.json

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
