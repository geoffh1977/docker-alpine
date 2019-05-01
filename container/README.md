# Alpine Linux Secure Container From Scratch #

The Alpine container is created from 'Scratch' using a binary file constructed from the Alpine repository. In addition to a custom build of the specified version of Alpine, a few changes are added in order to secure the build further:

* TimeZone is configured as per the container.conf setting
* A non-root user is created within the container
* The user is set in the USER directive for the next startup
* The CMD directive is set to the container shell

In order to build further images from this container - ensure to include a 'USER root' directive near the top of the file before any installations take place.
