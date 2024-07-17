# Installing Display Driver

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
	# No Display Driver
	echo "No Display Driver Selected (CPU Rendering May Cause Extreme Lag!)"
	echo "Skipping..."
	sleep 3
fi
clear
