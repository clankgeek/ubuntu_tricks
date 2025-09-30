#!/bin/bash

# Installing and configuring steam

echo "Installing Steam snap version"

sudo snap install steam
sudo snap refresh gaming-graphics-core22 --channel kisak-fresh
sudo apt install -y steam-devices --no-install-recommends
