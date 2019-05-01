# Build Alpine image from generated binary
# Create non-root user and secure container

FROM scratch
LABEL maintainer="geoffh1977 <geoffh1977@gmail.com>"

ADD binaries/rootfs.tar.gz /

ARG ALPINE_USER="user"
ARG ALPINE_UID="1000"
ARG ALPINE_GID="1000"

ENV ALPINE_USER=${ALPINE_USER} \
    ALPINE_UID=${ALPINE_UID} \
    ALPINE_GID=${ALPINE_GID}

RUN addgroup -g ${ALPINE_GID} ${ALPINE_USER} && adduser -D -u ${ALPINE_UID} -G ${ALPINE_USER} ${ALPINE_USER}

USER ${ALPINE_USER}
WORKDIR /home/user
CMD ["/bin/sh"]
