#!/bin/bash

set -ouex pipefail

### Configure packages
rpm-ostree override remove \
           firefox \
           firefox-langpacks \
           gnome-tour \
    && \
    rpm-ostree install \
               docker-cli \
               docker-compose \
               docker-buildx \
               input-remapper \
               google-noto-fonts-all \
               mg \
               podman-compose

systemctl enable docker.socket
systemctl enable input-remapper
systemctl enable podman.socket
