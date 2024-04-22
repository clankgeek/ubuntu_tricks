#!/bin/bash

echo "Replace tcp CUBIC by BBR"
echo ""

if grep -q "tcp_congestion_control" /etc/sysctl.conf; then
    echo "ERROR: tcp_congestion_control already exist into /etc/sysctl.conf"
    exit 1
fi

echo  "net.core.default_qdisc = fq" | sudo tee -a /etc/sysctl.conf
echo  "net.ipv4.tcp_congestion_control = bbr" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

echo "DONE"
