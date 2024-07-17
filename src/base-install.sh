##############################################################
##############################################################
# THANK YOU FOR USING THE KRUSHED ARCH INSTALLER
#
# THIS IS A SECONDARY FILE NEEDED DURING THE INSTALL PROCESS
# IF YOU ARE READING THIS... then you are most likely done
# it is safe to delete this folder and everything inside.
#
#
#
# Running this code most likely will do nothing
# but still don't unless you just wanna lose your system

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

cd
clear
loadkeys us
pacman -Syu
clear
hwclock --systohc
sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8' /etc/locale.gen
locale-gen
echo "LANG=en=US.UTF-8" >> /etc/locale.conf
echo "${SYSNAME}" > /etc/hostname
touch /etc/vconsole.conf
echo "KEYMAP=us" > /etc/vconsole.conf
clear

cat <<EOF > /etc/hosts
127.0.0.1	localhost
::1		localhost
127.0.1.1	${SYSNAME}.localdomain	${SYSNAME}
EOF
clear

mkinitcpio -P
clear
echo root:$ROOTPASSWORD | chpasswd
useradd -m -G wheel,storage,power,audo $USER
echo $USER:$PASSWORD | chpasswd
ln -s /usr/bin/vim /usr/bin/vi
systemctl enable NetworkManager.service sshd.service
cd /home/${USER}
chown -R $USER:$USER /home/$USER
clear
cd

#Grub
# AMD
if [[ $CPUPLAT == '1']]
then
	sudo sed -i 's/^GRUB_CMDLINE_DEFAULT="loglevel=3 quiet"/GRUB_CMDLINE_DEFAULT="initrd=\amd-ucode amd_pstate=active quiet loglevel=1 nowatchdog usbcore.autosuspend=-1 audit=0 pcie_aspm=off video=efifb:auto mitigations=off nvidia-drm.modeset=1"/' /etc/default/grub
# Nvidia
elif [[ $CPUPLAT == '2']]
then
	sudo sed -i 's/^GRUB_CMDLINE_DEFAULT="loglevel=3 quiet"/GRUB_CMDLINE_DEFAULT="initrd=\intel-ucode intel_pstate=active quiet loglevel=1 nowatchdog usbcore.autosuspend=-1 audit=0 pcie_aspm=off video=efifb:auto mitigations=off nvidia-drm.modeset=1"/' /etc/default/grub
fi

sudo sed -i 's/^#GRUB_DISABLE_OS_PROBER=false/GRUB_DISABLE_OS_PROBER=false/'

sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=${SYSNAME}-Grub-Manager

sudo grub-mkconfig -o /boot/grub/grub.cfg

su $USER -c /var/.tmp/.Krushed-Installer/user-install.sh
exit