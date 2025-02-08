#!/bin/bash

set -ouex pipefail

### Configure packages
rpm-ostree override remove \
           firefox \
           firefox-langpacks \
           gnome-tour \
    && \
    rpm-ostree install \
               input-remapper \
               google-noto-fonts-all \
               mg \
               podman-docker \
               podman-compose

systemctl enable input-remapper
systemctl enable podman.socket
