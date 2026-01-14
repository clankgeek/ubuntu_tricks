# ubuntu_tricks

Uniquement pour la version 24.04

Quelque scripts helper pour faciliter l'utilisation d'ubuntu.

---

## browser.sh

Installer facilement différent navigateurs:
- Chrome (apt, chromium based)
- Chromium (snap)
- Thorium (apt, chromium based)
- Vivaldi (apt, chromium based)
- Opera (snap, chromium based)
- Edge (apt, chromium based)
- Firefox (snap)
- Brave (apt, chromium based)
- Floorp (wget, firefox based)
- Librewolf (apt, firefox based)

## cleaner.sh

Pour nettoyer les paquets apt qui ne sont plus utilisés, mais aussi snap et flatpak.

## docker.sh

Installer docker, docker compose, et ajouter votre user au groupe docker.

## flatpak.sh

Installe flatpak et active le repo flathub.

## git.sh

Installe git et le configure pour utilisation avec vim.

## golang.sh

Installe golang en version snap pour avoir la dernière version disponible, le configure dans le repertoire ~/go

## kvm.sh

Active kvm et installe le client graphique virt-manager

## libreoffice.sh

Installe libreoffice writer et calc avec support de gnome ou kde.

## misc.sh

Active le repository Universe puis installe différent tools comme
- curl
- rar 
- unrar 
- ttf-mscorefonts-installer 
- gparted 
- vim 
- nomacs

## gaming.sh

Installe le lanceur steam (snap) et passe mesa en kisak-fresh
Installe le lanceur lutris (flatpak)
Installe le lanceur heroic (flatpak)

## tcpbbr.sh

Passe la congestion reseau de cubic a bbr pour augmenter le débit en local

## telemetry.sh

Désactive la télémétrie et les pubs.

## updater.sh

- Passe la rétention snap a 2 versions
- Met à jour les paquets apt
- Met à jour les paquets snap
- Met à jour les paquets flatpak

## vscode.sh

Installe visual studio code en version snap

## x86-64-v3

Si votre ubuntu est >= a la version 25.10 et que votre cpu est compatible, installe l'architecture x86-64-v3 à la place de la x86-64-v1

## zram.sh

Active zswap avec compression zstd, actif après reboot.

