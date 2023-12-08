#!/bin/bash

echo "Installing golang"

#sudo add-apt-repository ppa:longsleep/golang-backports
#sudo apt update
sudo apt install -f golang-go
echo "" >> ~/.bashrc
mkdir ~/go
echo "export GOPATH=$HOME/go" >> ~/.bashrc
echo "export PATH=\$PATH:\$GOPATH/bin" >> ~/.bashrc
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

