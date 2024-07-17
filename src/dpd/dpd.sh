# Installing Display Driver
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
PATHH= jq .PATHH /var/.tpm/.Krushed-Installer/.install.json
INSTALLER_PATH= jq .INSTALLER_PATH /var/.tpm/.Krushed-Installer/.install.json

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
