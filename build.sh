#!/bin/bash

set -ouex pipefail


# PACKAGES
# ----------------------------------------------------
EXCLUDED_PACKAGES=(
    adobe-source-code-pro-fonts
    bluefin-backgrounds
    bluefin-cli-logos
    bluefin-faces
    cascadia-code-fonts
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
    google-go-mono-fonts
    google-noto-color-emoji-fonts
    ibm-plex-mono-fonts
    mozilla-fira-mono-fonts
    nerd-fonts
    opendyslexic-fonts
    solaar
    tailscale
    ubuntu-family-fonts
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
    wl-clipboard
    zathura
    zathura-pdf-mupdf
)


dnf5 -y copr enable alternateved/bleeding-emacs

dnf5 remove -y "${EXCLUDED_PACKAGES[@]}"
dnf5 install -y "${INCLUDED_PACKAGES[@]}"

dnf5 -y copr disable alternateved/bleeding-emacs


# BLUEFIN OVERRIDES
# ----------------------------------------------------
dnf5 swap -y bluefin-logos fedora-logos

rm -rf '/usr/share/fonts/MesloLGS NF/'
rm -rf '/usr/share/fonts/monaspace/'
fc-cache -f
