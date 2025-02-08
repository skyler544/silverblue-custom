#!/bin/bash

set -ouex pipefail

### Configure packages
rpm-ostree override remove firefox firefox-langpacks vim
rpm-ostree install tmux mg

systemctl enable podman.socket
