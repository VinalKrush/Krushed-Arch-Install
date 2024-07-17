# Installing Selected Kernel
SYSNAME= jq .SYSNAME /var/.tpm/.Krushed-Installer/.install.json
USER= jq .USER /var/.tpm/.Krushed-Installer/.install.json
PASSWORD= jq .PASSWORD /var/.tpm/.Krushed-Installer/.install.json
ROOTPASSWORD= jq .ROOTPASSWORD /var/.tpm/.Krushed-Installer/.install.json
SYSDRIVE= jq .SYSDRIVE /var/.tpm/.Krushed-Installer/.install.json
CPUPLAT= jq .CPUPLAT /var/.tpm/.Krushed-Installer/.install.json
BETTERFOX= jq .BETTERFOX /var/.tpm/.Krushed-Installer/.install.json
KERN= jq .KERN /var/.tpm/.Krushed-Installer/.install.json
DPD= jq .DPD /var/.tpm/.Krushed-Installer/.install.json
KRUSHED= jq .KRUSHED /var/.tpm/.Krushed-Installer/.install.json
PATH= jq .PATH /var/.tpm/.Krushed-Installer/.install.json
INSTALLER_PATH= jq .INSTALLER_PATH /var/.tpm/.Krushed-Installer/.install.json

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
