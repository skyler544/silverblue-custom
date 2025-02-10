#!/bin/bash

set -ouex pipefail

### Configure packages
rpm-ostree override remove \
           default-fonts-core-emoji \
           google-noto-color-emoji-fonts \
           gnome-tour \
           yaru-theme \
           yaru-gtk2-theme \
           yaru-sound-theme \
           yaru-icon-theme \
           yaru-gtksourceview-theme \
           yaru-gtk4-theme \
           yaru-gtk3-theme \
           gnome-shell-theme-yaru \
    && \
    rpm-ostree install \
               google-noto-emoji-fonts \
               mg
