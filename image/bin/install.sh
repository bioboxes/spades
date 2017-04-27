#!/bin/bash

set -o errexit
set -o nounset
set -o xtrace

BUILD="wget ca-certificates"
ESSENTIAL="python-minimal python-setuptools openjdk-7-jre-headless"

# Build dependencies
apt-get update --yes
apt-get install --yes --no-install-recommends ${BUILD}

export PATH=${PATH}:/usr/local/bin/install

spades.sh
bbtools.sh

# Clean up dependencies
apt-get autoremove --purge --yes ${BUILD}
apt-get clean

# Install required files
apt-get install --yes --no-install-recommends ${ESSENTIAL}
rm -rf /var/lib/apt/lists/*
