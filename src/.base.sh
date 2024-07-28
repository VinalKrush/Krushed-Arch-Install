#!/usr/bin/env bash

HOST_N= jq .HOST_N /.kinstall/install.json
USER_N= jq .USER_N /.kinstall/install.json
USER_P= jq .USER_P /.kinstall/install.json
ROOT_P= jq .ROOT_P /.kinstall/install.json
CPUU_M= jq .CPUU_M /.kinstall/install.json
GPUU_M= jq .GPUU_M /.kinstall/install.json
KERN_T= jq .KERN_T /.kinstall/install.json
ARCH_K= jq .ARCH_K /.kinstall/install.json
clear

base_install() {
    cd
    clear
    loadkeys us
    pacman -Syu --noconfirm
    clear
    hwclock --systohc
    sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8' /etc/locale.gen
    locale-gen
    echo "LANG=en_US.UTF-8" >> /etc/locale.conf
    echo "${HOST_N}" > /etc/hostname
    touch /etc/vconsole.conf
    echo "KEYMAP=us" > /etc/vconsole.conf
    clear

    mkinitcpio -P
    clear
    echo root:$ROOT_P | chpasswd
    useradd -m -G wheel,storage,power,audio,video $USER_N
    echo $USER_N:$USER_P | chpasswd
    ln -s /usr/bin/vim /usr/bin/vi
    systemctl enable NetworkManager.service sshd.service
    cd /home/$USER_N
    chown -R $USER_N:$USER_N /home/$USER_N
    clear
    cd

    #Grub
    # AMD
    if [[ $CPUU_M == '1' ]]; then
	    sudo sed -i 's/^GRUB_CMDLINE_DEFAULT="loglevel=3 quiet"/GRUB_CMDLINE_DEFAULT="initrd=\amd-ucode amd_pstate=active quiet loglevel=1 nowatchdog usbcore.autosuspend=-1 audit=0 pcie_aspm=off video=efifb:auto mitigations=off nvidia-drm.modeset=1"/' /etc/default/grub
    # INTEL
    else
	    sudo sed -i 's/^GRUB_CMDLINE_DEFAULT="loglevel=3 quiet"/GRUB_CMDLINE_DEFAULT="initrd=\intel-ucode intel_pstate=active quiet loglevel=1 nowatchdog usbcore.autosuspend=-1 audit=0 pcie_aspm=off video=efifb:auto mitigations=off nvidia-drm.modeset=1"/' /etc/default/grub
    fi

    sudo sed -i 's/^#GRUB_DISABLE_OS_PROBER=false/GRUB_DISABLE_OS_PROBER=false/'

    sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=${HOST_N}-Grub-Manager

    sudo grub-mkconfig -o /boot/grub/grub.cfg


    su $USER_N -c /.kinstall/.usr.sh
}

base_install
exit