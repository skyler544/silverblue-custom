#!/bin/bash

set -ouex pipefail

### Configure packages
rpm-ostree override remove firefox firefox-langpacks \
           && rpm-ostree install mg

systemctl enable podman.socket
