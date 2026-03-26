#!/usr/bin/env bash
set -e

cd ~/SUPERCOMPUTING/assignments/assignment_07/data

mkdir -p clean

for file in raw/*.fastq
do
    base=$(basename "$file" .fastq)

    fastp \
        -i raw/${base}.fastq \
        -o clean/${base}.clean.fastq
done
