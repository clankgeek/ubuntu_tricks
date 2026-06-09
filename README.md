# ubuntu_tricks

Uniquement pour la version 24.04 ou 26.04

Quelque scripts helper pour faciliter l'utilisation d'ubuntu.

---

## browser.sh

Menu interactif pour installer facilement différents navigateurs :
- Chrome (apt, chromium based)
- Chromium (snap)
- Thorium (apt, chromium based)
- Vivaldi (apt, chromium based)
- Opera (snap, chromium based)
- Edge (apt, chromium based)
- Firefox (snap)
- Brave (apt, chromium based)
- Floorp (apt, firefox based)
- Librewolf (apt, firefox based)
- Mullvad Browser (apt, firefox based)

## cleaner.sh

Pour nettoyer les paquets apt qui ne sont plus utilisés, mais aussi snap et flatpak.

## gaming.sh

Installe le lanceur steam (snap) et passe mesa en kisak-fresh.
Installe le lanceur lutris (flatpak).
Installe le lanceur heroic (flatpak).

## software.sh

Menu interactif pour installer différents logiciels :
- LibreOffice Writer et Calc (apt, avec support gnome/kde)
- Mattermost Desktop (snap)
- Teams for Linux (apt)
- Visual Studio Code (snap)
- VirtualBox 7.2 (apt)
- KVM / virt-manager (apt)

## updater.sh

- Passe la rétention snap à 2 versions
- Met à jour les paquets apt
- Met à jour les paquets snap
- Met à jour les paquets flatpak

## utils.sh

Menu interactif pour configurer l'environnement système :
- Docker + docker-compose (apt, ajoute l'utilisateur au groupe docker)
- Flatpak (apt, active le repo flathub)
- Git (apt, configuré avec vim, rebase, prompt bash)
- Golang (snap, configuré dans ~/go)
- TCP BBR (remplace cubic par bbr via sysctl)
- Désactivation de la télémétrie et des pubs
- Activation de l'architecture X86-64-v3 (Ubuntu >= 25.10)
- Zram avec compression zstd (actif après reboot)
- Outils divers : curl, rar, unrar, ms fonts, gparted, vim, nomacs (apt)

