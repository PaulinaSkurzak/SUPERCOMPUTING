#!/bin/bash

export PATH="$HOME/programs/Flye/bin:$PATH"

mkdir -p ./assemblies/assembly_local

flye --nano-hq ./data/SRR33939694.fastq.gz --meta --threads 6 --out-dir ./assemblies/assembly_local

mv ./assemblies/assembly_local/assembly.fasta ./local_assembly.fasta
mv ./assemblies/assembly_local/flye.log ./local_flye.log

rm -rf ./assemblies/assembly_local/*

mv ./local_assembly.fasta ./assemblies/assembly_local/
mv ./local_flye.log ./assemblies/assembly_local/
