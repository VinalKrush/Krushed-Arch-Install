#!/bin/bash

# KINSTALLER SCRIPT FOR KRUSHED ARCH INSTALLER

# Check if running as root
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

pacman -Sy --needed dialog jq


# Move the script to /usr/bin/ and make it executable
touch /usr/bin/kinstall
cp ./src/bin/kinstall.sh /usr/bin/kinstall
chmod +x /usr/bin/kinstall

# Making Config File
# Check if the directory exists
if [ ! -d "/etc/kinstall" ]; then
  # Directory does not exist, create it
  mkdir -p "/etc/kinstall"
fi

cp -rf ./src/* /etc/kinstall


# This will only show if it installed right (not much can really go wrong ngl)
echo ""
echo ""
echo ""
echo ""
echo "kback installed successfully"
echo ""
echo "It is not recommended to save backups to the default location."
echo "To change the location of saved backups"
echo "Edit /etc/kback/kback.conf"