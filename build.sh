#!/bin/bash

set -ouex pipefail

### Install packages
rpm-ostree override remove firefox firefox-langpacks vim \
    && rpm-ostree install -y tmux mg

systemctl enable podman.socket
