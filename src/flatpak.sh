#!/bin/bash

echo "Installing flatpak"

sudo apt install -y flatpak "$(dpkg -l |grep gnome-software -q && echo 'gnome-software-plugin-flatpak')"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
