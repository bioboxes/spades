#!/bin/bash

set -o errexit
set -o nounset
set -o xtrace

TASK=$1
CMD=$(fetch_task_from_taskfile.sh $TASKFILE $TASK)
READS=$(biobox_args.sh 'select(has("fastq")) | .fastq | map(.value) | join(",")')

eval ${CMD}
