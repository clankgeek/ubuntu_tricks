#!/bin/bash

# installation of different browsers

install_prepare() {
    sudo apt update
    sudo apt install -y curl wget gnupg apt-transport-https ca-certificates
}

install_with_extrepo() {
    sudo apt update
    sudo apt install extrepo -y
    sudo extrepo enable "$1"
    sudo apt update
    sudo apt install -y "$2"
}

install_chrome() {
    echo "Installing Google Chrome"
    install_with_extrepo "google_chrome" "google-chrome-stable"
}

install_edge() {
    echo "Installing Microsoft Edge"
    install_with_extrepo "edge" "microsoft-edge-stable"
}

install_chromium() {
    echo "Installing Chromium"
    sudo snap install chromium
}

install_firefox() {
    echo "Installing Firefox"
    sudo apt install firefox firefox-locale-fr -y
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
    install_with_extrepo "librewolf" "librewolf"
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

install_brave() {
    echo "Installing Brave"
    install_with_extrepo "brave_release" "brave-browser"
}

install_floorp() {
    echo "Installing Floorp"
    url=$(curl -s https://api.github.com/repos/Floorp-Projects/Floorp/releases/latest 2>&1|jq --raw-output '.assets[2] | .browser_download_url')
    if [ "x$url" != "x" ]; then
        curl -s -L "$url" | tar xjfv - -C ~/floorp
        echo "Floorp is extracted to ~/floorp"
    else
        echo "Download error"
        exit 1
    fi
}

echo "What browser do you want to install?"
echo " 1 - Chrome (apt, chromium based)"
echo " 2 - Chromium (snap)"
echo " 3 - Thorium (apt, chromium based)"
echo " 4 - Vivaldi (apt, chromium based)"
echo " 5 - Opera (snap, chromium based)"
echo " 6 - Edge (apt, chromium based)"
echo " 7 - Firefox (snap)"
echo " 8 - Brave (snap, chromium based)"
echo " 9 - Floorp (wget, firefox based)"
echo " 0 - Librewolf (apt, firefox based)"
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
8) install_brave ;;
9) install_floorp ;;
0) install_librewolf;;
*) echo "Nothing to do" ;;
esac
