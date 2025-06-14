FROM ghcr.io/ublue-os/bluefin-dx:stable

### MODIFICATIONS
## Customizations to the base image
COPY packages.sh /tmp/packages.sh
COPY mg /usr/bin/mg

RUN /tmp/packages.sh && \
    ostree container commit

### LINTING
## Verify final image and contents are correct.
RUN bootc container lint
