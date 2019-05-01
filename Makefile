# Project Makefile
include container.conf
export $(shell sed 's/=.*//' container.conf)

.PHONY: build run build.binary build.container all clean

all: build

build: build.binary build.container

build.binary:
	@if [ ! -d ${PWD}/container/binaries ] ; then mkdir ${PWD}/container/binaries ; fi
	@if [ ! -f ${PWD}/container/binaries/rootfs.tar.gz ] ; then rm -f ${PWD}/container/binaries/rootfs.tar.gz ; fi
	docker build -t ${dockerUser}/alpine:builder --build-arg IMAGE_NAME=${buildImageName} --build-arg IMAGE_VERSION=${buildImageVersion} builder/
	docker run --rm -v ${PWD}/container/binaries:/tmp/out ${dockerUser}/alpine:builder -E -c -t ${timeZone} -r v${finalImageVersion} -m ${buildBaseUrl}
	docker rmi -f ${dockerUser}/alpine:builder ${buildImageName}:${buildImageVersion}

build.container:
	@if [ ! -f ${PWD}/container/binaries/rootfs.tar.gz ] ; then echo No Binary File To Install ; exit 1 ; fi
	docker build -t ${dockerUser}/${finalImageName}:${finalImageVersion} --build-arg ALPINE_USER=${alpineUser} --build-arg ALPINE_UID=${alpineUid} --build-arg ALPINE_GID=${alpineGid} container/
	docker tag ${dockerUser}/${finalImageName}:${finalImageVersion} ${dockerUser}/${finalImageName}:latest
	@rm -f ${PWD}/container/binaries/rootfs.tar.gz

run:
	$(call colors)
	@echo -e Starting Container...
	@docker run -it --rm ${dockerUser}/${finalImageName}:${finalImageVersion}
	@echo -e Container Stopped

clean:
	docker rmi -f ${dockerUser}/${finalImageName}:latest
	docker rmi -f ${dockerUser}/${finalImageName}:${finalImageVersion}
	if [ ! -f ${PWD}/container/binaries/rootfs.tar.gz ] ; then rm -f ${PWD}/container/binaries/rootfs.tar.gz ; fi
