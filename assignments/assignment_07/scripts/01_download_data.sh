#!/usr/bin/env bash
set -e

cd ~/SUPERCOMPUTING/assignments/assignment_07/data

mkdir -p raw
mkdir -p dog_reference
mkdir -p tmp

tail -n +2 SraRunTable.csv | cut -d',' -f1 | while read run
do
    fasterq-dump "$run" -O raw -t tmp -e 2 -p
done

cd dog_reference
datasets download genome taxon "Canis familiaris" --reference --filename dog_genome.zip
unzip -o dog_genome.zip
