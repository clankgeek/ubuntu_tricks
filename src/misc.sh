#!/bin/bash

echo "Enable universe repository"
sudo add-apt-repository -y universe

echo "Install ms fonts and common tools"
sudo apt install -y curl rar unrar ttf-mscorefonts-installer gparted vim nomacs
