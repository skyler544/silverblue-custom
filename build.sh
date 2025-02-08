#!/bin/bash

set -ouex pipefail

### Install packages
dnf remove -y firefox firefox-langpacks vim \
    && dnf install -y tmux mg

systemctl enable podman.socket
