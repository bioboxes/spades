#!/bin/bash

set -o errexit
set -o nounset
set -o xtrace

TASK=$1
CMD=$(fetch_task_from_taskfile.sh $TASKFILE $TASK)
TMP=$(mktemp -d)
DATA=$(mktemp -d)/input.yaml

yaml2json < ${INPUT} | jq --from-file /usr/local/share/spades_input.jq > ${DATA}

export MEM=$(available_ram.py)
export ARGS="--dataset ${DATA} -o ${TMP} --threads $(nproc) --memory ${MEM} --phred-offset 33"

eval ${CMD}

cp ${TMP}/contigs.fasta ${OUTPUT}/contigs.fa

cat << EOF > ${OUTPUT}/biobox.yaml
version: 0.9.0
arguments:
  - fasta:
    - id: contigs_1
      value: contigs.fa
      type: contigs
EOF

rm -rf /tmp/tmp.*
