#!/bin/bash

# Installing and configuring flatpak

echo "Installing flatpak"
sudo apt install -y flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install -y easyflatpak
