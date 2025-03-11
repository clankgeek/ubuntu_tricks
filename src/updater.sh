#!/bin/bash

sudo apt update
sudo apt -o APT::Get::Always-Include-Phased-Updates=true upgrade -y
test -f /usr/lib/snapd && sudo snap refresh
test -f /usr/bin/flatpak && sudo flatpak update -y
