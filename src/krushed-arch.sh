#!/usr/bin/env bash

main_install() {
    dialog --no-cancel --pause "Welcom To The Krushed Installer" 10 70 5
    dialog --title "Are You Ready?" --yesno "Please make sure you have already partition and mounted your drives to /mnt, Otherwise the installer will fail." 7 70 || exit
    cp -rf ./etc/ /etc/
    clear
    sudo pacman -Sy
    
    # Basic Vars
    HOST_N=$(dialog --no-cancel --title "Hostname" --inputbox "Please Enter A Hostname" 5 70 3>&1 1>&2 2>&3 3>&-)
    USER_N=$(dialog --no-cancel --title "Username" --inputbox "Please Enter A Username" 5 70 3>&1 1>&2 2>&3 3>&-)
    USER_P=$(dialog --insecure --no-cancel --title "Password" --passwordbox "Please Enter A Password" 5 70 3>&1 1>&2 2>&3 3>&-)
    ROOT_P=$(dialog --insecure --no-cancel --title "Root Password" --passwordbox "Please Enter A Root Password" 5 70 3>&1 1>&2 2>&3 3>&-)
    CPUU_M=$(dialog --no-cancel --title "CPU Platform" --menu "CPU Platform:" 10 70 0 1 "INTEL" 2 "AMD" 3>&1 1>&2 2>&3 3>&-)
    GPUU_M=$(dialog --no-cancel --title "Display Drivers" --menu "Display Drivers:" 10 70 0 1 "AMD RADEON" 2 "NVIDIA" 3 "INTEL" 4 "NONE" 3>&1 1>&2 2>&3 3>&-)
    KERN_T=$(dialog --no-cancel --title "Linux Kernel" --menu "Kernels:" 10 70 0 1 "Linux" 2 "Linux Zen" 3 "Linux Hardened" 4 "Linux LTS" 3>&1 1>&2 2>&3 3>&-)
    ARCH_K=$(dialog --no-cancel --title "Install Type" --menu "Install Type:" 10 70 0 1 "Krushed Arch Linux" 2 "Arch Linux" 3>&1 1>&2 2>&3 3>&-)

    install_json=$(cat <<EOF
{
    "HOST_N": "${HOST_N}",
    "USER_N": "${USER_N}",
    "USER_P": "${USER_P}",
    "ROOT_P": "${ROOT_P}",
    "CPUU_M": "${CPUU_M}",
    "GPUU_M": "${GPUU_M}",
    "KERN_T": "${KERN_T}",
    "ARCH_K": "${ARCH_K}"
}    
EOF
    )
    sudo rm install.json
    touch install.json
    echo $install_json >> install.json

    # Base Install
    dialog --no-ok --no-cancel --title "Installing Arch For \"${USER_N}\" ON \"${HOST_N}\"" --prgbox "pacstrap -K -P base base-devel jq dialog" 20 70
    mkdir -p /mnt/.kinstall
    cp -rf ./* /mnt/.kinstall/
    cp -rf ./etc/ /mnt/etc/

    # Kernel Install
    if [[ $KERN_T == '1' ]]; then
            dialog --no-ok --no-cancel --title "Installing Linux Kernel" --prgbox "pacstrap /mnt linux linux-firmware linux-headers" 20 70
    elif [[ $KERN_T == '2' ]]; then
            dialog --no-ok --no-cancel --title "Installing Linux Zen Kernel" --prgbox "pacstrap /mnt linux-zen linux-firmware linux-headers" 20 70
    elif [[ $KERN_T == '3' ]]; then
            dialog --no-ok --no-cancel --title "Installing Linux Hardened Kernel" --prgbox "pacstrap /mnt linux-hardened linux-firmware linux-headers" 20 70
    else
            dialog --no-ok --no-cancel --title "Installing Linux LTS Kernel" --prgbox "pacstrap /mnt linux-lts linux-firmware linux-headers" 20 70
    fi

    # GPU Driver Install
    if [[ $GPUU_M == '1' ]]; then
            dialog --no-ok --no-cancel --title "Installing AMD Drivers" --prgbox "pacstrap /mnt lib32-vkd3d vkd3d lib32-vulkan-driver lib32-amdvlk mesa lib32-mesa xf86-video-amdgpu vulkan-radeon libva-mesa-driver lib32-libva-mesa-driver mesa-vdpau lib32-mesa-vdpau" 20 70
    elif [[ $GPUU_M == '2' ]]; then
            dialog --no-ok --no-cancel --title "Installing NVIDIA Drivers" --prgbox "pacstrap /mnt lib32-vkd3d vkd3d lib32-vulkan-driver nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings" 20 70
    elif [[ $GPUU_M == '3' ]]; then 
            dialog --no-ok --no-cancel --title "Installing INTEL Drivers" --prgbox "pacstrap /mnt lib32-vkd3d vkd3d lib32-vulkan-driver mesa lib32-mesa vulkan-intel lib32-vulkan-intel" 20 70
    fi

    # Microcode Install
    if [[ $CPUU_M == '1' ]]; then
        dialog --no-ok --no-cancel --title "Installing Intel Microcode" --prgbox "pacstrap /mnt intel-ucode" 20 70
    else
        dialog --no-ok --no-cancel --title "Installing AMD Microcode" --prgbox "pacstrap /mnt amd-ucode" 20 70
    fi

    # Installing Basic Packages
    dialog --no-ok --no-cancel --title "Installing Basic Packages" --prgbox "pacstrap /mnt grub os-prober efibootmgr vim git xorg xorg-server openssh wayland dhclient networkmanager" 20 70

    dialog --no-ok --no-cancel --pause "Please wait... These next few steps may take some time..." 5 70 3
    clear
    genfstab -U /mnt >> /mnt/etc/fstab
    clear
    chmod +x /mnt/.kinstall/.base.sh
    chmod +x /mnt/.kinstall/.krushed.sh
    chmod +x /mnt/.kinstall/.usr.sh

    arch-chroot /mnt bash /mnt/.kinstall/.base.sh

    clear

    dialog --no-cancel --title "The Arch Install Is Done!" --msgbox "Feel free to restart whenever" 5 70


}

main_install
exit