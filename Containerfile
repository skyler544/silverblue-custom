FROM ghcr.io/ublue-os/bluefin-dx:stable

### MODIFICATIONS
COPY packages.sh /tmp/packages.sh
COPY regen-initramfs.sh /usr/local/sbin/regen-initramfs.sh
COPY remove-bluefin-gschema-overrides.sh /usr/local/sbin/remove-bluefin-gschema-overrides.sh
COPY mg /usr/bin/mg

### PACKAGES
RUN /tmp/packages.sh && \
    ostree container commit

### GSCHEMA
RUN /usr/local/sbin/remove-bluefin-gschema-overrides.sh

### INITRAMFS
RUN /usr/local/sbin/regen-initramfs.sh

### LINTING
## Verify final image and contents are correct.
RUN bootc container lint
