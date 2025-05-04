FROM ghcr.io/ublue-os/bluefin-dx:stable

### MODIFICATIONS
## Customizations to the base image
COPY build.sh /tmp/build.sh
COPY mg /usr/bin/mg

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit
    
### LINTING
## Verify final image and contents are correct.
RUN bootc container lint
