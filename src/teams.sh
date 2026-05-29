#!/bin/bash

# Installing and configuring Teams for linux

echo "Installing Teams for linux"

sudo apt install -y extrepo
sudo extrepo enable teams-for-linux
sudo apt update
sudo apt install -y teams-for-linux
