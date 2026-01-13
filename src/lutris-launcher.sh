#!/bin/bash

# Installing and configuring Lutris

# detect if flatpak is installed
if ! command -v flatpak &> /dev/null
then
	echo "flatpak could not be found, installing flatpak"
	echo "Install flatpak before proceeding with Lutris installation"
	exit 1
fi

flatpak install -y Lutris

echo ""
echo "Lutris has been installed via flatpak."
