#!/bin/bash

URL="http://downloads.sourceforge.net/project/bbmap/BBMap_${BBTOOLS_VERSION}.tar.gz"

fetch_archive.sh ${URL} bbtools
ln -s /usr/local/bbtools/bbmerge-auto.sh /usr/local/bin
