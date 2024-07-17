## NOTE
# This is for installing the base system.
# If you would like to change or add your own packages,
# Please take a look at src/krushed-install.sh or the config file coming soon
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

pacstrap -K /mnt grub os-prober efibootmgr vim git xorg xorg-server openssh wayland dhclient networkmanager

# Installing UCODE
if [[ $CPUPLAT == '1' ]]
then
	pacstrap -K /mnt amd-ucode
elif [[ $CPUPLAT == '2' ]]
then
	pacstrap -K /mnt intel-ucode
fi
clear