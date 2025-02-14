#!/bin/bash

set -ouex pipefail


EXCLUDED_PACKAGES=(
    cascadia-code-fonts
    default-fonts-core-emoji
    gnome-shell-theme-yaru
    gnome-tour
    google-noto-color-emoji-fonts
    solaar
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
    mg
    papirus-icon-theme
    papirus-icon-theme-dark
    papirus-icon-theme-light
    wl-clipboard
)


dnf -y copr enable alternateved/bleeding-emacs

rpm-ostree override remove "${EXCLUDED_PACKAGES[@]}"
rpm-ostree install "${INCLUDED_PACKAGES[@]}"

dnf -y copr disable alternateved/bleeding-emacs
