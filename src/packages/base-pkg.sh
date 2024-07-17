## NOTE
# This is for installing the base system.
# If you would like to change or add your own packages,
# Please take a look at src/krushed-install.sh or the config file coming soon

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