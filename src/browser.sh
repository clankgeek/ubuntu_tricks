#!/bin/bash

install_prepare() {
    sudo apt update
    sudo apt install -y wget gnupg apt-transport-https ca-certificates
}

install_chrome() {
    echo "Installing Google Chrome"
    install_prepare
    test -f /usr/share/keyrings/chrome.gpg || wget -O- https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/chrome.gpg
    sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/chrome.gpg] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
    sudo apt update
    sudo apt install -y google-chrome-stable
}

install_edge() {
    echo "Installing Microsoft Edge"
    install_prepare
    test -f /usr/share/keyrings/microsoft.gpg ||wget -O- https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/microsoft.gpg
    sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/microsoft.gpg arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge.list'
    sudo apt update
    sudo apt install -y microsoft-edge-stable
}

install_chromium() {
    echo "Installing Chromium"
    sudo snap install chromium
}

install_firefox() {
    echo "Installing Firefox"
    sudo snap install firefox
}

install_thorium() {
    echo "Installing Thorium"
    install_prepare
    wget https://dl.thorium.rocks/debian/dists/stable/thorium.list
    sudo mv thorium.list /etc/apt/sources.list.d/
    sudo apt update
    sudo apt install thorium-browser -y
}

install_librewolf() {
    echo "Installing Librewolf"
    install_prepare
    source /etc/lsb-release
    test -f /usr/share/keyrings/librewolf.gpg || wget -O- https://deb.librewolf.net/keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/librewolf.gpg
    sudo sh -c "echo \"deb [arch=amd64 signed-by=/usr/share/keyrings/librewolf.gpg] https://deb.librewolf.net ${DISTRIB_CODENAME} main\" > /etc/apt/sources.list.d/librewolf-browser.list"
    sudo apt update
    sudo apt install librewolf -y
}

install_vivaldi() {
    echo "Installing Vivaldi"
    install_prepare
    test -f /usr/share/keyrings/vivaldi-browser.gpg || wget -O- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/vivaldi-browser.gpg
    sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/vivaldi-browser.gpg arch=amd64] https://repo.vivaldi.com/archive/deb/ stable main" > /etc/apt/sources.list.d/vivaldi-browser.list'
    sudo apt update
    sudo apt install vivaldi-stable -y
}

install_opera() {
    echo "Installing Opera"
    sudo snap install opera
}

echo "What browser do you want to install?"
echo " 1 - Chrome (apt, chromium based)"
echo " 2 - Chromium (snap)"
echo " 3 - Thorium (apt, chromium based)"
echo " 4 - Vivaldi (apt, chromium based)"
echo " 5 - Opera (snap, chromium based)"
echo " 6 - Edge (apt, chromium based)"
echo " 7 - Firefox (snap)"
# echo " 8 - Librewolf (apt, firefox based)"
echo "What is your choice ?"

read menu_choice
case "$menu_choice" in
1) install_chrome ;;
2) install_chromium ;;
3) install_thorium ;;
4) install_vivaldi ;;
5) install_opera ;;
6) install_edge ;;
7) install_firefox ;;
# 8) install_librewolf;;
*) echo "Nothing to do" ;;
esac
