#!/bin/bash


# NOTE, THE KINSTALLER SCRIPT IS NOT EXECUTED HERE
# THIS SCRIPT JUST POINTS TO THE ACTUAL SCRIPT IN /etc/kinstall

if [ "$(id -u)" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

chmod +x /etc/kinstall/krushed-arch.sh
sudo /etc/kinstall/krushed-arch.sh