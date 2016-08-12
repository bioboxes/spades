#!/bin/bash

set -o errexit
set -o nounset
set -o xtrace

BUILD="wget ca-certificates"
ESSENTIAL="python-minimal python-setuptools"

URL="http://spades.bioinf.spbau.ru/release3.9.0/SPAdes-3.9.0-Linux.tar.gz"

# Build dependencies
apt-get update --yes
apt-get install --yes --no-install-recommends ${BUILD}

# Install bbmap
wget ${URL} --quiet --output-document - \
  | tar xzf - --directory /usr/local/ --strip-components=1

# Clean up dependencies
apt-get autoremove --purge --yes ${BUILD}
apt-get clean

# Install required files
apt-get install --yes --no-install-recommends ${ESSENTIAL}
rm -rf /var/lib/apt/lists/*
