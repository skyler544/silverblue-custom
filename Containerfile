FROM ghcr.io/ublue-os/bluefin-dx:stable

### MODIFICATIONS
## Customizations to the base image
COPY packages.sh /tmp/packages.sh
COPY mg /usr/bin/mg

RUN /tmp/packages.sh && \
    ostree container commit

### INITRAMFS
RUN KVER="$(rpm -qa | grep -P 'kernel-(\d+\.\d+\.\d+)' | sed -E 's/kernel-//')" \
    && dracut --no-hostonly --kver "$KVER" --reproducible -v --add ostree -f \
    "/lib/modules/$KVER/initramfs.img" \
    && chmod 0600 "/lib/modules/$KVER/initramfs.img"

### LINTING
## Verify final image and contents are correct.
RUN bootc container lint
