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

clear
cd

clear
echo "-----------------------------------------------------------------------------------------------------"
echo "---                                                                                               ---"
echo "---                                                                                               ---"
echo "---                                       KRUSHED INSTALLER                                       ---"
echo "---                                                                                               ---"
echo "---                                                                                               ---"
echo "---                                              55%                                              ---"
echo "-----------------------------------------------------------------------------------------------------"
echo ""
echo "|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@---------------------------------------------|"
sleep 5
clear
yay -Syu --needed --noconfirm ark konsole steam lutris flatpak dpkg jre-openjdk jre8-openjdk jre11-openjdk jre17-openjdk jre21-openjdk gnome-calculator fzf ufw lib32-vkd3d lightdm web-greeter plasma vesktop libreoffice-fresh dolphin kvantum ocs-url qemu libvirt edk2-ovmf virt-manager ebtables dnsmasq

yay -Rns --needed --noconfirm sddm sddm-kcm

# LightDM
#
clear
echo "-----------------------------------------------------------------------------------------------------"
echo "---                                                                                               ---"
echo "---                                                                                               ---"
echo "---                                       KRUSHED INSTALLER                                       ---"
echo "---                                                                                               ---"
echo "---                                                                                               ---"
echo "---                                              70%                                              ---"
echo "-----------------------------------------------------------------------------------------------------"
echo ""
echo "|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-----------------------------------|"
sleep 5
clear

sudo cp -rf /.Krushed-Installer/lightdm /etc/

clear
echo "-----------------------------------------------------------------------------------------------------"
echo "---                                                                                               ---"
echo "---                                                                                               ---"
echo "---                                       KRUSHED INSTALLER                                       ---"
echo "---                                                                                               ---"
echo "---                                                                                               ---"
echo "---                                              80%                                              ---"
echo "-----------------------------------------------------------------------------------------------------"
echo ""
echo "|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@----------|"
sleep 5
clear

echo "INSTALLING ZSH"
echo "DO NOT SET ZSH AS DEFAULT TERMINAL"
echo "WHEN YOU ENTER ZSH, TYPE EXIT"
echo "PRESS ENTER IF YOU UNDERSTAND"
read UNDRSTAND
sleep 2
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

clear
echo "-----------------------------------------------------------------------------------------------------"
echo "---                                                                                               ---"
echo "---                                                                                               ---"
echo "---                                       KRUSHED INSTALLER                                       ---"
echo "---                                                                                               ---"
echo "---                                                                                               ---"
echo "---                                              90%                                              ---"
echo "-----------------------------------------------------------------------------------------------------"
echo ""
echo "|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-----|"
sleep 5
clear

sudo systemctl enable libvirtd.service virtlogd.socket lightdm.service

sudo systemctl restart libvirtd
sudo systemctl enable libvirtd

sudo virsh net-autostart default
sudo virsh net-start default
exit