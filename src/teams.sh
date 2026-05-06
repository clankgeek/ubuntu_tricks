#!/bin/bash

# Installing and configuring Teams for linux

echo "Installing Teams for linux"

sudo mkdir -p /etc/apt/keyrings
sudo wget -qO /etc/apt/keyrings/teams-for-linux.asc https://repo.teamsforlinux.de/teams-for-linux.asc
sh -c 'echo "Types: deb\nURIs: https://repo.teamsforlinux.de/debian/\nSuites: stable\nComponents: main\nSigned-By: /etc/apt/keyrings/teams-for-linux.asc\nArchitectures: amd64" | sudo tee /etc/apt/sources.list.d/teams-for-linux-packages.sources'
sudo apt update && sudo apt install teams-for-linux
