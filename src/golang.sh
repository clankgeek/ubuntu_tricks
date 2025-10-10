#!/bin/bash

# Installing and configuring golang

echo "Installing golang"

sudo apt install snapd gcc #gcc needs if CGO_ENABLED=1
sudo snap install go --classic
mkdir -p ~/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

echo "" >> ~/.bashrc
echo "export GOPATH=$HOME/go" >> ~/.bashrc
echo "export PATH=\$PATH:\$GOPATH/bin" >> ~/.bashrc

