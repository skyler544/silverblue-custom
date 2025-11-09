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
    cascadia-code-fonts
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
