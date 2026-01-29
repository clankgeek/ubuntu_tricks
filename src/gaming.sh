#!/bin/bash

install_flatpak() {
	sudo apt install -y flatpak
	sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

install_protonup() {
	echo "Installing ProtonUp-Qt (flatpak)"
	install_flatpak
	sudo flatpak install -y net.davidotek.pupgui2
}

install_steam() {
	echo "Installing Steam snap version"
	sudo apt install -y snapd
	sudo snap install steam
	sudo snap refresh gaming-graphics-core22 --channel kisak-fresh
	sudo apt install -y steam-devices --no-install-recommends
}

install_heroic() {
	echo "Installing Heroic Games Launcher (flatpak)"
	install_flatpak
	sudo flatpak install -y com.heroicgameslauncher.hgl
}

install_lutris() {
	echo "Installing Lutris (flatpak)"
	install_flatpak
	sudo flatpak install -y net.lutris.Lutris
}

echo "What launcher do you want to install?"
echo " 1 - Steam (snap)"
echo " 2 - Heroic Games Launcher (flatpak)"
echo " 3 - Lutris (flatpak)"
echo " 4 - ProtonUp-Qt (flatpak)"
echo " 5 - Steam + Heroic + Lutris + ProtonUp-Qt"
echo "What is your choice ?"

read menu_choice
case "$menu_choice" in
1) install_steam ;;
2) install_heroic ;;
3) install_lutris ;;
4) install_protonup ;;
5)
	install_steam
	install_heroic
	install_lutris
	install_protonup
	;;
*) echo "Nothing to do" ;;
esac
