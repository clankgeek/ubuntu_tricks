#!/bin/bash

# System utilities configuration and installation

setup_docker() {
	echo "Installing Docker"
	sudo apt install -y docker.io docker-compose-v2
	sudo usermod -a -G docker "$(id -u -n)"
	sudo systemctl enable --now docker
}

setup_flatpak() {
	echo "Installing Flatpak"
	sudo apt install -y flatpak
	sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
	sudo flatpak install -y easyflatpak
}

setup_git() {
	echo "Installing Git"
	sudo apt install -f git git-lfs tig vim
	git config --global core.editor "vim"
	git config --global core.autocrlf input
	git config --global pull.rebase true
	git config --global rebase.autoStash true
	tee -a ~/.bashrc << EOM
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
EOM
}

setup_golang() {
	echo "Installing Golang"
	sudo apt install snapd gcc #gcc needed if CGO_ENABLED=1
	sudo snap install go --classic
	mkdir -p ~/go/bin
	export GOPATH=$HOME/go
	export PATH=$PATH:$GOPATH/bin
	echo "" >> ~/.bashrc
	echo "export GOPATH=$HOME/go" >> ~/.bashrc
	echo "export PATH=\$PATH:\$GOPATH/bin" >> ~/.bashrc
}

setup_tcpbbr() {
	echo "Replace TCP CUBIC by BBR"
	if grep -q "tcp_congestion_control" /etc/sysctl.conf; then
		echo "ERROR: tcp_congestion_control already exists in /etc/sysctl.conf"
		exit 1
	fi
	echo "net.core.default_qdisc = fq" | sudo tee -a /etc/sysctl.conf
	echo "net.ipv4.tcp_congestion_control = bbr" | sudo tee -a /etc/sysctl.conf
	sudo sysctl -p
	echo "DONE"
}

setup_telemetry() {
	echo "Disable telemetry and ads"
	command -v pro >/dev/null && sudo pro config set apt_news=false
	command -v ubuntu-report >/dev/null && ubuntu-report -f send no
	test -f /etc/default/whoopsie && sudo sed -i 's/report_crashes=true/report_crashes=false/' /etc/default/whoopsie
	test -f /etc/default/apport && sudo sed -i 's/enabled=1/enabled=0/g' /etc/default/apport
	command -v gsettings >/dev/null && gsettings set com.canonical.Unity.Lenses remote-content-search none
}

setup_x86_64_v3() {
	if /lib64/ld-linux-x86-64.so.2 --help | grep x86-64-v3 -q; then
		echo "CPU compatible with X86-64-v3"
	else
		echo "CPU not compatible with X86-64-v3, exiting"
		exit 1
	fi
	if dpkg --compare-versions "$DISTRIB_RELEASE" "ge" "25.10"; then
		echo "Distribution is ready to receive x86-64-v3 architecture"
		echo 'APT::Architecture-Variants "amd64v3";' | sudo tee /etc/apt/apt.conf.d/99enable-amd64v3
		sudo apt update
		sudo apt full-upgrade
	else
		echo "Distribution is not >= 25.10, exiting"
		exit 1
	fi
}

setup_zram() {
	echo "Enable zram (needs reboot after install)"
	sudo apt purge zram-config
	sudo apt install -y systemd-zram-generator
	sudo mkdir /etc/systemd/zram-generator.conf.d/
	echo "[zram0]" | sudo tee /etc/systemd/zram-generator.conf.d/compression-algorithm.conf
	echo "compression-algorithm = zstd" | sudo tee -a /etc/systemd/zram-generator.conf.d/compression-algorithm.conf
	sudo systemctl daemon-reload
	echo "Reboot to activate"
}

setup_misc() {
	echo "Misc configuration"
	sudo add-apt-repository -y universe
	sudo apt install -y curl rar unrar ttf-mscorefonts-installer gparted vim nomacs
}

echo "What do you want to configure?"
echo " 1 - Install Docker (apt)"
echo " 2 - Install Flatpak (apt)"
echo " 3 - Install Git (apt)"
echo " 4 - Install Golang (snap)"
echo " 5 - Enable TCP BBR (sysctl)"
echo " 6 - Disable telemetry"
echo " 7 - Enable X86-64-v3"
echo " 8 - Enable Zram (apt)"
echo " 9 - Install Miscellaneous Tools : rar, ms fonts, gparted, vim, nomacs (apt)"
echo "What is your choice ?"

read menu_choice
case "$menu_choice" in
1) setup_docker ;;
2) setup_flatpak ;;
3) setup_git ;;
4) setup_golang ;;
5) setup_tcpbbr ;;
6) setup_telemetry ;;
7) setup_x86_64_v3 ;;
8) setup_zram ;;
9) setup_misc ;;
*) echo "Nothing to do" ;;
esac
