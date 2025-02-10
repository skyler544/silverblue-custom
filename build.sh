#!/bin/bash

set -ouex pipefail

### Configure packages
rpm-ostree override remove \
           gnome-tour \
           yaru-theme \
    && \
    rpm-ostree install \
               mg
