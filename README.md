# Alpine Docker Image

## Description
Creates a slight modification to the Alpine Docker image by adding a non-user account and setting the account as the default user. This stops the image from immediatly having root level access to a docker host and requires that the command ```USER root``` is specifically called before modifying the image during the build process.
