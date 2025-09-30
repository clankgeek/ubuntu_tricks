#!/bin/bash

# Installing and configuring Docker

echo "Installing docker"

sudo apt install -y docker.io docker-compose-v2
sudo usermod -a -G docker "$(id -u -n)"
sudo systemctl enable --now docker

