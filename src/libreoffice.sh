#!/bin/bash

echo "Installing libreoffice writer and calc"

sudo apt install -y libreoffice-l10n-fr libreoffice-writer libreoffice-calc
if [ "$XDG_SESSION_DESKTOP" = "ubuntu" ]; then
    sudo apt install -y libreoffice-gnome
fi
if [ "$XDG_SESSION_DESKTOP" = "KDE" ]; then
    sudo apt install -y libreoffice-plasma
fi
