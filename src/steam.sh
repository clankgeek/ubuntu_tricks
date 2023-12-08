#!/bin/bash

echo "Installing Steam snap version"

snap install steam
snap refresh gaming-graphics-core22 --channel kisak-fresh
sudo apt install -y steam-devices --no-install-recommends
