#!/bin/bash

set -ouex pipefail

EXCLUDED_PACKAGES=(
    bluefin-plymouth
    bluefin-backgrounds
    bluefin-cli-logos
    bluefin-faces
    cockpit-bridge
    cockpit-machines
    cockpit-networkmanager
    cockpit-ostree
    cockpit-podman
    cockpit-selinux
    cockpit-storaged
    cockpit-system
    default-fonts-core-emoji
    gnome-shell-extension-appindicator
    gnome-shell-extension-blur-my-shell
    gnome-shell-extension-dash-to-dock
    gnome-shell-extension-gsconnect
    gnome-shell-extension-logo-menu
    gnome-shell-extension-tailscale-gnome-qs
    gnome-shell-theme-yaru
    gnome-tour
    google-noto-color-emoji-fonts
    tailscale
    yaru-gtk2-theme
    yaru-gtk3-theme
    yaru-gtk4-theme
    yaru-gtksourceview-theme
    yaru-icon-theme
    yaru-sound-theme
    yaru-theme
)

INCLUDED_PACKAGES=(
    emacs
    google-noto-emoji-fonts
    papirus-icon-theme
    papirus-icon-theme-dark
    papirus-icon-theme-light
    stow
    terminus-fonts-console
    zathura
    zathura-pdf-mupdf
)

DNF="dnf --assumeyes"

$DNF remove "${EXCLUDED_PACKAGES[@]}"
$DNF install "${INCLUDED_PACKAGES[@]}"
$DNF swap bluefin-logos fedora-logos

$DNF autoremove && $DNF clean all
