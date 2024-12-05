#!/bin/bash

echo "Installing golang"

#sudo add-apt-repository ppa:longsleep/golang-backports
#sudo apt update
sudo apt install -f golang-go
mkdir ~/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

echo "" >> ~/.bashrc
echo "export GOPATH=$HOME/go" >> ~/.bashrc
echo "export PATH=\$PATH:\$GOPATH/bin" >> ~/.bashrc

