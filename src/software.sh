#!/bin/bash

# Installation of different software

install_libreoffice() {
	echo "Installing LibreOffice Writer and Calc"
	sudo apt install -y libreoffice-l10n-fr libreoffice-writer libreoffice-calc
	if [ "$XDG_SESSION_DESKTOP" = "ubuntu" ]; then
		sudo apt install -y libreoffice-gnome
	fi
	if [ "$XDG_SESSION_DESKTOP" = "KDE" ]; then
		sudo apt install -y libreoffice-plasma
	fi
}

install_mattermost() {
	echo "Installing Mattermost (snap)"
	sudo apt install -y snapd
	sudo snap install mattermost-desktop --classic
}

install_teams() {
	echo "Installing Teams for Linux"
	sudo apt install -y extrepo
	sudo extrepo enable teams-for-linux
	sudo apt update
	sudo apt install -y teams-for-linux
}

install_vscode() {
	echo "Installing Microsoft Visual Studio Code"
	sudo apt install -y snapd
	sudo snap install code --classic
}

install_virtualbox() {
	echo "Installing VirtualBox"
	sudo apt install -y extrepo
	sudo extrepo enable virtualbox
	sudo apt update
	sudo apt install -y virtualbox-7.2
}

install_kvm() {
	echo "Installing KVM"
	sudo apt install -y qemu-kvm libvirt-daemon-system virt-manager
}

install_element_matrix() {
	echo "Installing Element Matrix"
	sudo apt install -y wget apt-transport-https
	sudo wget -O /usr/share/keyrings/element-io-archive-keyring.gpg https://packages.element.io/debian/element-io-archive-keyring.gpg
	echo "deb [signed-by=/usr/share/keyrings/element-io-archive-keyring.gpg] https://packages.element.io/debian/ default main" | sudo tee /etc/apt/sources.list.d/element-io.list
	sudo apt update
	sudo apt install -y element-desktop
}

echo "What software do you want to install?"
echo " 1 - LibreOffice (apt)"
echo " 2 - Mattermost (snap)"
echo " 3 - Teams for Linux (apt)"
echo " 4 - Visual Studio Code (snap)"
echo " 5 - VirtualBox 7.2 (apt)"
echo " 6 - KVM (apt)"
echo " 7 - Element Matrix (apt)"
echo "What is your choice ?"

read menu_choice
case "$menu_choice" in
1) install_libreoffice ;;
2) install_mattermost ;;
3) install_teams ;;
4) install_vscode ;;
5) install_virtualbox ;;
6) install_kvm ;;
7) install_element_matrix ;;
*) echo "Nothing to do" ;;
esac
