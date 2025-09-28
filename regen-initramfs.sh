#!/bin/bash
set -ouex pipefail

KVER="$(rpm -qa | grep -P 'kernel-(\d+\.\d+\.\d+)' | sed -E 's/kernel-//')"
OUTPUT_IMG="/lib/modules/$KVER/initramfs.img"
MODULES="ostree bluetooth"

dracut --force \
       --no-hostonly \
       --reproducible \
       --add "$MODULES" \
       --kver "$KVER" \
       "$OUTPUT_IMG"

chmod 0600 "$OUTPUT_IMG"
