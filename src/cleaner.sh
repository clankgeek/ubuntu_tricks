#!/bin/bash

# cleaning repositories, apt, snap, or flatpak.

sudo apt autoclean
sudo apt --purge autoremove -y
sudo apt purge ~c -y

if command -v snap &>/dev/null; then
    sudo snap set system refresh.retain=2
    LANG=C snap list --all | awk '/disabled/{print $1, $3}' | while read snapname revision; do sudo snap remove "$snapname" --revision="$revision"; done
    LANG=C snap saved|grep -Eo "^([0-9]+)" | while read snapid; do sudo snap forget "$snapid"; done
fi

command -v flatpak &>/dev/null && flatpak uninstall --unused
