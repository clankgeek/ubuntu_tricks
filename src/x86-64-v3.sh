#!/bin/bash

if /lib64/ld-linux-x86-64.so.2 --help|grep x86-64-v3 -q; then
    echo "cpu compatible with X86-64-v3"
else
    echo "cpu not compatible with X86-64-V3, exiting"
    exit 1
fi

if dpkg --compare-versions "$DISTRIB_RELEASE" "ge" "25.10"; then
    echo "distribution is ready to receive x86-64-v3 architecure"
    echo 'APT::Architecture-Variants "amd64v3";' | sudo tee /etc/apt/apt.conf.d/99enable-amd64v3
    sudo apt update
    sudo apt full-upgrade
else
    echo "distribution is not >= 25.10, exiting"
    exit 1
fi
