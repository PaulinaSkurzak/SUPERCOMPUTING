#!/bin/bash

DATA_DIR="/sciclone/scr10/gzdata440/lesson_05/data/"

for FWD in ${DATA_DIR}/*_R1_*
do
REV=${FWD/_R1_/_R2_}
OUT=${FWD%_L001_R1_sample.fastq}_interleave_chop${1}.fastq
echo $FWD $REV $OUT $1

./scripts/interleave_chop.sh $FWD $REV $OUT $1 
done
