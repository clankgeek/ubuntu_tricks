#!/bin/bash

sudo apt update
sudo apt upgrade -y
test -f /usr/lib/snapd && sudo snap refresh
test -f /usr/bin/flatpak && sudo flatpak update -y
