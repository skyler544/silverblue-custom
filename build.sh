#!/bin/bash

set -ouex pipefail

### Install packages
dnf install -y tmux mg
dnf remove -y firefox vim

systemctl enable podman.socket
