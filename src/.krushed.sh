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

krushed_install() {
    cd
    yay -Syu --needed --noconfirm ark konsole steam lutris flatpak dpkg jre-openjdk jre8-openjdk jre11-openjdk jre17-openjdk jre21-openjdk gnome-calculator fzf ufw lib32-vkd3d lightdm web-greeter plasma vesktop libreoffice-fresh dolphin kvantum ocs-url qemu libvirt edk2-ovmf virt-manager ebtables dnsmasq
    clear
    yay -Rns --noconfirm sddm sddm-kcm
    clear

    echo "INSTALLING ZSH"
    echo "DO NOT SET ZSH AS DEFAULT TERMINAL"
    echo "WHEN YOU ENTER ZSH, TYPE \"exit\""
    echo "PRESS ENTER IF YOU UNDERSTAND"
    read
    clear

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    clear
    sudo cp -rf /.kinstall/.zshrc /home/$USER_N/.zshrc

    sudo systemctl enable libvirtd.service virtlogd.socket lightdm.service
    sudo virsh net-autostart default
    sudo virsh net-start default
}

krushed_install
exit