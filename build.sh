#!/bin/bash

set -ouex pipefail

### Install packages
dnf install -y tmux mg
# dnf remove -y firefox firefox-langpacks vim

systemctl enable podman.socket
