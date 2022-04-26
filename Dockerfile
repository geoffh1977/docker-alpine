# Modify Alpine Image With Non-Root User
FROM alpine
LABEL maintainer="geoffh1977 <geoffh1977@gmail.com>"

ARG alpineUser=user \
    alpineGroup=user \
    alpineUid=1000 \
    alpineGid=1000

ENV ALPINE_USER=$alpineUser \
    ALPINE_GROUP=$alpineGroup \
    ALPINE_UID=$alpineUid \
    ALPINE_GID=$alpineGid

RUN addgroup -g ${ALPINE_GID} ${ALPINE_USER} && \
    adduser -D -u ${ALPINE_UID} -G ${ALPINE_USER} ${ALPINE_USER}

USER ${ALPINE_USER}
WORKDIR /home/${ALPINE_USER}
CMD ["/bin/sh"]
