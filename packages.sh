#!/bin/bash

# PREPARATION
# ----------------------------------------------------
set -ouex pipefail

DNF="dnf --quiet --assumeyes"

EXCLUDED_PACKAGES=(
    bluefin-backgrounds
    bluefin-cli-logos
    bluefin-faces
    bluefin-plymouth
    cockpit-bridge
    cockpit-machines
    cockpit-networkmanager
    cockpit-ostree
    cockpit-podman
    cockpit-selinux
    cockpit-storaged
    cockpit-system
    code
    default-fonts-core-emoji
    gnome-shell-extension-appindicator
    gnome-shell-extension-blur-my-shell
    gnome-shell-extension-dash-to-dock
    gnome-shell-extension-gsconnect
    gnome-shell-extension-logo-menu
    gnome-shell-extension-search-light
    gnome-tour
    google-noto-color-emoji-fonts
    malcontent-control
    tailscale
)

INCLUDED_PACKAGES=(
    emacs
)


# PACKAGES
# ----------------------------------------------------
$DNF remove "${EXCLUDED_PACKAGES[@]}"
$DNF install "${INCLUDED_PACKAGES[@]}"
$DNF swap bluefin-logos fedora-logos


# CLEANUP
# ----------------------------------------------------
$DNF autoremove && $DNF clean all
rm -f /var/log/dnf*.log
rm -rf /var/lib/dnf
rm -rf /var/lib/alternatives
