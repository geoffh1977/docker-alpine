# Builds Alpine Filesystem
FROM alpine:latest AS build

COPY scripts/mkimage-alpine.bash scripts/apk-install /

RUN chmod u+x /apk-install /mkimage-alpine.bash && \
    sync && \
    /apk-install bash tzdata && \
    /mkimage-alpine.bash -E -c -t Australia/Melbourne -r v3.9 -m http://dl-cdn.alpinelinux.org/alpine

# Build New Alpine Container And Secure With Non-Root Access
FROM scratch AS release
LABEL maintainer="geoffh1977 <geoffh1977@gmail.com>"

COPY --from=build /var/tmp/rootfs/ /

ENV ALPINE_USER=user \
    ALPINE_UID=1000 \
    ALPINE_GID=1000 \
    ALPINE_VERSION=3.9.3

RUN addgroup -g ${ALPINE_GID} ${ALPINE_USER} && adduser -D -u ${ALPINE_UID} -G ${ALPINE_USER} ${ALPINE_USER}

USER ${ALPINE_USER}
WORKDIR /home/user
CMD ["/bin/sh"]
