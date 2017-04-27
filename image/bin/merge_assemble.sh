#!/bin/bash

READS=$(biobox_args.sh 'select(has("fastq")) | .fastq | map(.value) | join(",")')

UNMERGED=$(mktemp -d)/paired.fq.gz
MERGED=$(mktemp -d)/single.fq.gz

bbmerge-auto.sh \
	in=${READS} \
	adapters=default \
	out=${MERGED} \
	outu=${UNMERGED} \
	rsem \
	k=62 \
	prefilter=1 \
	prealloc

spades.py \
	--only-assembler \
	-k25,55,95,125 \
	--phred-offset 33 \
	-s ${MERGED} \
	--12 ${UNMERGED} \
	-o $1
