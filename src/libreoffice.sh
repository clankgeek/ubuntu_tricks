#!/bin/bash

echo "Installing libreoffice writer and calc"

sudo apt install -y libreoffice-l10n-fr libreoffice-writer libreoffice-calc
if grep -qi '"Ubuntu' /etc/lsb-release; then
    sudo apt install -y libreoffice-gnome
fi
if grep -qi '"Kubuntu' /etc/lsb-release; then
    sudo apt install -y libreoffice-plasma
fi
