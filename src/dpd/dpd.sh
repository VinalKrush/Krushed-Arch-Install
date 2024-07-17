# Installing Display Driver
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
