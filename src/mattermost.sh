#!/bin/bash

# Installing and configuring Mattermost (snap)

echo "Installing Mattermost (snap)"

sudo apt install -y snapd
sudo snap install mattermost-desktop --classic
