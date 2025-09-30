#!/bin/bash

# Installing and configuring zswap, needs reboot after install

echo "Enable zswap in addition to swap file"

sudo apt purge zram-config

sudo apt install -y systemd-zram-generator
sudo mkdir /etc/systemd/zram-generator.conf.d/
echo "[zram0]" | sudo tee /etc/systemd/zram-generator.conf.d/compression-algorithm.conf
echo  "compression-algorithm = zstd" | sudo tee -a /etc/systemd/zram-generator.conf.d/compression-algorithm.conf

sudo systemctl daemon-reload
echo "Reboot to activate
