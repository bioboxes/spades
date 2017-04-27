#!/bin/bash

URL="http://spades.bioinf.spbau.ru/release${SPADES_VERSION}/SPAdes-${SPADES_VERSION}-Linux.tar.gz"

fetch_archive.sh ${URL} spades
ln -s /usr/local/spades/bin/* /usr/local/bin/
