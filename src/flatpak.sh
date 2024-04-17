#!/bin/bash

echo "Installing flatpak"

sudo apt install -y flatpak "$(dpkg -l |grep gnome-menus -q && echo gnome-software-plugin-flatpak)"
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
