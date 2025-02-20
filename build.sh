#!/bin/bash

set -ouex pipefail


# PACKAGES
# ----------------------------------------------------
EXCLUDED_PACKAGES=(
    adobe-source-code-pro-fonts
    cascadia-code-fonts
    default-fonts-core-emoji
    gnome-shell-theme-yaru
    gnome-tour
    google-go-mono-fonts
    google-noto-color-emoji-fonts
    ibm-plex-mono-fonts
    mozilla-fira-mono-fonts
    nerd-fonts
    opendyslexic-fonts
    solaar
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
    mg
    papirus-icon-theme
    papirus-icon-theme-dark
    papirus-icon-theme-light
    stow
    zathura
    zathura-pdf-poppler
    wl-clipboard
)


dnf -y copr enable alternateved/bleeding-emacs

rpm-ostree override remove "${EXCLUDED_PACKAGES[@]}"
rpm-ostree install "${INCLUDED_PACKAGES[@]}"

dnf -y copr disable alternateved/bleeding-emacs


# BLUEFIN OVERRIDES
# ----------------------------------------------------
rm -rf '/usr/share/fonts/MesloLGS NF/'
rm -rf '/usr/share/fonts/monaspace/'
fc-cache -f

PLYMOUTH_DIR=/usr/share/plymouth/themes/spinner
PIXMAP_DIR=/usr/share/pixmaps

watermark_files=(
    "$PLYMOUTH_DIR/watermark.png"
    "$PLYMOUTH_DIR/silverblue-watermark.png"
)

logo_files=(
    "$PIXMAP_DIR/fedora-gdm-logo.png"
    "$PIXMAP_DIR/fedora-logo.png"
    "$PIXMAP_DIR/fedora_logo_med.png"
    "$PIXMAP_DIR/fedora_whitelogo_med.png"
)

for target in "${watermark_files[@]}"; do
    cp /tmp/fedora-watermark.png "$target"
done

for target in "${logo_files[@]}"; do
    cp /tmp/fedora_whitelogo_med.png "$target"
done
