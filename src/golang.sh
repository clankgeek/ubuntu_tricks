#!/bin/bash

echo "Installing golang"

#sudo add-apt-repository ppa:longsleep/golang-backports
#sudo apt update
#sudo apt install -f golang-go
snap install go --classic
mkdir -p ~/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

echo "" >> ~/.bashrc
echo "export GOPATH=$HOME/go" >> ~/.bashrc
echo "export PATH=\$PATH:\$GOPATH/bin" >> ~/.bashrc

