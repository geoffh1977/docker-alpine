# Alpine Linux Base Image Container Build #

![Alpine Logo](https://raw.githubusercontent.com/geoffh1977/docker-alpine/master/images/logo.svg)

## Description ##
This repository contains a custom build of an Alpine Linux container built from scratch. The build improves the security of the Alpine Linux base container by:

* Adding a non-root user named "user" which a UID of 1000 and GID of 1000.
* Adds a default timezone. Currently set to "Australia/Melbourne" because that is where I live. :)
* A Makefile which simplifies the local build setup
* An automated version update and automated release script to allow for rolling Alpine repository updates
* A YAML configuration file where all the variables are kept in one nice location

_N.B. As the Alpine Build creates a defaulot non-root user. Future builds in this images build-chain will require a USER root command to allow for installations and system-level container configuration._

## Downloading The Alpine Container ##
This repository is connected to Docker Hub - so you will always find the latest builds there. Execute the _docker pull_ command in order to get the required image:

* geoffh1977/alpine:latest - The latest build that was completed
* geoffh1977/alpine:3 - The latest build of a Major version number.
* geoffh1977/alpine:3.9 - The latest build of a Minor version series.
* geoffh1977/alpine:3.9.3 - An Exact Version

## Building The Alpine Container ##
After cloning the repository, simply execute the _make build_ command while in the repository root path to execute a docker build of the current Dockerfile. The Makefile contains a number of useful commands which perform different actions.

### Getting In Contact ###
If you find any issues with this container or want to recommend some improvements, fell free to get in contact with me or submit pull requests on github.
