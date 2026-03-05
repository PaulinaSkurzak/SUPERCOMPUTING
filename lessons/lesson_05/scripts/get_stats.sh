#!/bin/bash

# take files as input


# run seqkit stats on them all
seqkit stats ${SHARED_DIR}/lesson_05/data/*.fastq > ./outputs/stats.tsv
# export results 
