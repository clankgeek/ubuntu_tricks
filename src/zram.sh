#!/bin/bash

echo "Enabling Zram instead of SWAP file"

sudo swapoff -a
sudo sed -i '/ swap / s/^/#/' /etc/fstab
sudo rm -f /swap*
sudo apt purge zram-config

sudo apt install -y systemd-zram-generator
sudo mkdir /etc/systemd/zram-generator.conf.d/
echo "[zram0]" | sudo tee /etc/systemd/zram-generator.conf.d/compression-algorithm.conf
echo  "compression-algorithm = zstd" | sudo tee -a /etc/systemd/zram-generator.conf.d/compression-algorithm.conf

sudo systemctl daemon-reload
sudo systemctl restart systemd-zram-setup@zram0.service
