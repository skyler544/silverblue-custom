FROM ghcr.io/ublue-os/bluefin-dx:gts

### MODIFICATIONS
## Customizations to the base image
COPY packages.sh /tmp/packages.sh
COPY regen-initramfs.sh /usr/local/sbin/regen-initramfs.sh
COPY mg /usr/bin/mg

RUN /tmp/packages.sh && \
    ostree container commit

### INITRAMFS
RUN /usr/local/sbin/regen-initramfs.sh

### LINTING
## Verify final image and contents are correct.
RUN bootc container lint
