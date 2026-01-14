#!/bin/bash

install_steam() {
	echo "Installing Steam snap version"
	sudo apt install -y snapd
	sudo snap install steam
	sudo snap refresh gaming-graphics-core22 --channel kisak-fresh
	sudo apt install -y steam-devices --no-install-recommends

	echo ""
	echo "Download ProtonUp-QT appimage from https://github.com/DavidoTek/ProtonUp-Qt/tags"
	echo "Make it executable and run it to install additional Proton versions or other compatibility tools like GloriousEggroll's GE-Proton."
	echo "To enable Proton-GE for all titles, go to Steam Settings > compatibilities and choose 'Proton-GE'."
	echo "Enjoy gaming on Linux!"
	echo ""
}

install_heroic() {
	echo "Installing Heroic Games Launcher (flatpak)"
	sudo apt install -y flatpak
	sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
	sudo flatpak install -y com.heroicgameslauncher.hgl
}

install_lutris() {
	echo "Installing Lutris (flatpak)"
	sudo apt install -y flatpak
	sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
	sudo flatpak install -y net.lutris.Lutris
}

echo "What launcher do you want to install?"
echo " 1 - Steam (snap)"
echo " 2 - Heroic Games Launcher (flatpak)"
echo " 3 - Lutris (flatpak)"
echo " 4 - Steam + Heroic + Lutris"
echo "What is your choice ?"

read menu_choice
case "$menu_choice" in
1) install_steam ;;
2) install_heroic ;;
3) install_lutris ;;
4)
	install_steam
	install_heroic
	install_lutris
	;;
*) echo "Nothing to do" ;;
esac
