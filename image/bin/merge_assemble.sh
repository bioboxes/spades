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

# Check which files contain reads
ARGS=()
[[ ! -s ${UNMERGED} ]] || ARGS+=(" --pe1-12 ${UNMERGED}")
[[ ! -s ${MERGED} ]] || ARGS+=(" --s2 ${MERGED}")


spades.py \
	${ARGS[@]} \
	-k25,55,95,125 \
	--phred-offset 33 \
	-o $1
