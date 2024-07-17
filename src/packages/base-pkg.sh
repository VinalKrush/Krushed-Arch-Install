## NOTE
# This is for installing the base system.
# If you would like to change or add your own packages,
# Please take a look at src/krushed-install.sh or the config file coming soon

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