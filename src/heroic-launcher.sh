#!/bin/bash

# Installing and configuring Heroic Launcher

# detect if flatpak is installed
if ! command -v flatpak &> /dev/null
then
	echo "flatpak could not be found, installing flatpak"
	echo "Install flatpak before proceeding with Heroic installation"
	exit 1
fi

flatpak install -y Heroic

echo ""
echo "Heroic has been installed via flatpak."
