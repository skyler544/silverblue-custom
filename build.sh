#!/bin/bash

set -ouex pipefail

dnf -y copr enable alternateved/bleeding-emacs

### Configure packages
rpm-ostree override remove \
           default-fonts-core-emoji \
           gnome-shell-theme-yaru \
           gnome-tour \
           google-noto-color-emoji-fonts \
           yaru-gtk2-theme \
           yaru-gtk3-theme \
           yaru-gtk4-theme \
           yaru-gtksourceview-theme \
           yaru-icon-theme \
           yaru-sound-theme \
           yaru-theme \
    && \
    rpm-ostree install \
               emacs \
               google-noto-emoji-fonts \
               mg \
               papirus-icon-theme \
               papirus-icon-theme-dark \
               papirus-icon-theme-light \
               wl-clipboard

dnf -y copr disable alternateved/bleeding-emacs
