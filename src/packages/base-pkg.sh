## NOTE
# This is for installing the base system.
# If you would like to change or add your own packages,
# Please take a look at src/krushed-install.sh or the config file coming soon

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