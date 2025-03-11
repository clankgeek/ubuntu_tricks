#!/bin/bash

sudo apt autoclean
sudo apt --purge autoremove
sudo apt purge ~c

if [ -e /usr/lib/snapd ]; then
    sudo snap set system refresh.retain=2
    LANG=C snap list --all | awk '/disabled/{print $1, $3}' | while read snapname revision; do sudo snap remove "$snapname" --revision="$revision"; done
    LANG=C snap saved|grep -Eo "^([0-9]+)" | while read snapid; do sudo snap forget "$snapid"; done
fi

test -f /usr/bin/flatpak && flatpak uninstall --unused
