#!/bin/bash
# Update The Software Version From Online

# Get The Versions Of The Software
SITE_VERSION=$(curl -s https://www.alpinelinux.org/downloads/ | grep "Current Alpine Version" | grep -Eo "[0-9]\.[0-9](\.[0-9])?")
LOCAL_VERSION=$(grep "finalImageVersion" config.yml | cut -d: -f 2 | sed 's/ //g')

# Check Versions And Update File
if [ "$SITE_VERSION" != "$LOCAL_VERSION" ]
then
  MAJOR_VERSION=$(echo "${SITE_VERSION}" | cut -d. -f 1)
  MINOR_VERSION=$(echo "${SITE_VERSION}" | cut -d. -f 2)
  sed -i "s/^finalImageVersion:.*/finalImageVersion: ${SITE_VERSION}/" config.yml
  sed -i "s/^alpineDirVersion:.*/alpineDirVersion: ${MAJOR_VERSION}.${MINOR_VERSION}/" config.yml
  sed -i "s/^alpineMajorVersion:.*/alpineMajorVersion: ${MAJOR_VERSION}/" config.yml
  echo "Version Updated. New Version Set To ${SITE_VERSION}"
else
  echo "No Version Change Required."
fi
