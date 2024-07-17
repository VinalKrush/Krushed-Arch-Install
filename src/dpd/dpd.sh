# Installing Display Driver

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

if [[ $DPD == '1']]
then
	# Install NVIDIA Drivers (ew)
	pacstrap -K /mnt nvidia-dkms nvidia nvidia-utils lib32-nvidia-utils
elif [[ $DPD == '2']]
then
	# Install INTEL Drivers
	pacstrap -K /mnt mesa lib32-mesa vulkan-intel lib32-vulkan-intel
elif [[ $DPD == '3']]
then
	# AMD Drivers
	pacstrap -K /mnt mesa lib32-mesa xf86-video-amdgpu vulkan-radeon libva-mesa-driver lib32-libva-mesa-driver mesa-vdpau lib32-mesa-vdpau
else 
then 
	# No Display Driver
	echo "No Display Driver Selected (CPU Rendering May Cause Extreme Lag!)"
	echo "Skipping..."
	sleep 3
fi
clear
