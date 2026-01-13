#!/bin/bash

# Installing and configuring steam

echo "Installing Steam snap version"

sudo apt install -y snapd
sudo snap install steam
sudo snap refresh gaming-graphics-core22 --channel kisak-fresh
sudo apt install -y steam-devices --no-install-recommends

echo ""
echo "Download ProtonUp-QT appimage from https://github.com/DavidoTek/ProtonUp-Qt/tags"
echo "Make it executable and run it to install additional Proton versions or other compatibility tools like GloriousEggroll's GE-Proton."
echo "To enable Proton-GE for all titles, go to Steam Settings > compatibilities and choose 'Proton-GE'."
echo "Enjoy gaming on Linux!"
