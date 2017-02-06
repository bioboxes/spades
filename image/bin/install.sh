#!/bin/bash

set -o errexit
set -o nounset
set -o xtrace

BUILD="wget ca-certificates"
ESSENTIAL="python-minimal python-setuptools"

URL="http://spades.bioinf.spbau.ru/release${SPADES_VERSION}/SPAdes-${SPADES_VERSION}-Linux.tar.gz"

# Build dependencies
apt-get update --yes
apt-get install --yes --no-install-recommends ${BUILD}

fetch_archive.sh ${URL} spades
ln -s /usr/local/spades/bin/* /usr/local/bin/

# Clean up dependencies
apt-get autoremove --purge --yes ${BUILD}
apt-get clean

# Install required files
apt-get install --yes --no-install-recommends ${ESSENTIAL}
rm -rf /var/lib/apt/lists/*
