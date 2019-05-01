# Builds Alpine filesystem binary package
ARG IMAGE_NAME=alpine
ARG IMAGE_VERSION=latest

FROM ${IMAGE_NAME}:${IMAGE_VERSION}
LABEL maintainer="geoffh1977 <geoffh1977@gmail.com>"

COPY scripts/mkimage-alpine.bash scripts/apk-install /
RUN chmod u+x /apk-install /mkimage-alpine.bash && \
    sync && \
    /apk-install bash tzdata

ENTRYPOINT ["/mkimage-alpine.bash"]

