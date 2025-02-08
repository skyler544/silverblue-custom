#!/bin/bash

set -ouex pipefail

### Configure packages
rpm-ostree override remove \
           firefox \
           firefox-langpacks \
           gnome-tour \
    && \
    rpm-ostree install \
               docker-buildx-plugin \
               docker-ce \
               docker-ce-cli \
               docker-compose-plugin \
               input-remapper \
               google-noto-fonts-all \
               mg \
               podman-compose

systemctl enable docker.socket
systemctl enable input-remapper
systemctl enable podman.socket
