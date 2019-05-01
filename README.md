# Alpine Linux Secure Container Build #

This project creates an Alpine Linux container from scratch, and adds a few container updates to secure the Alpine container. The project contains:

* The Alpine Builder container - Builds the root filesystem file from Alpine Repository
* The Alpine container - Builds the Alpine container from scratch, using the pre-built root filesystem.
* The Container configuration variables are stored in the container.conf for easy editing
* A Makefile has been provided to simplify the build process.

README files are available in both containers sub-directories explaining each container in further detail.
