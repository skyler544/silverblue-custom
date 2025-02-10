#!/bin/bash

set -ouex pipefail

### Configure packages
rpm-ostree override remove \
           gnome-tour \
           yaru-theme \
           gnome-shell-theme-yaru \
    && \
    rpm-ostree install \
               mg
