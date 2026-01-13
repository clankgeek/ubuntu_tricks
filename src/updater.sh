#!/bin/bash

# update all

sudo apt update
sudo apt upgrade -y
command -v snap &>/dev/null && sudo snap refresh
command -v flatpak &>/dev/null && sudo flatpak update -y
