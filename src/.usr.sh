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

user_install() {
    cd
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin
    makepkg -si --noconfirm
    cd
    sudo rm -rf yay-bin
    clear

    yay -Syu --needed --noconfirm pipewire lib32-pipewire wireplumber pipewire-audio pipewire-alsa pipewire-pulse pipewire-jack lib32-pipewire-jack fastfetch firefox git zsh vim ldns noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-hack-nerd wget curl xclip unzip unrar gparted gnome-disk-utility gvfs gvfs-afc bpytop os-prober grub-customizer less qpwgraph fuse3 fuse2 alsa-utils btrfs-progs exfat-utils ntfs-3g mkinitcpio-randommac mkinitcpio-archlogo mkinitcpio-numlock mkinitcpio-firmware numlockx

    if [[ $GPUU_M == '2' ]]; then
        sudo systemctl enable nvidia-resume.service
    fi

    if [[ $ARCH_K == '1' ]]; then
        sudo /.kinstall/.krushed.sh
    fi
}

user_install
exit