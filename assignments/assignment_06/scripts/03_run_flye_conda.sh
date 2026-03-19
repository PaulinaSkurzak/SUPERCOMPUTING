#!/bin/bash

module load miniforge3
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate flye-env

mkdir -p ./assemblies/assembly_conda

flye --nano-hq ./data/SRR33939694.fastq.gz --meta --threads 6 --out-dir ./assemblies/assembly_conda

mv ./assemblies/assembly_conda/assembly.fasta ./conda_assembly.fasta
mv ./assemblies/assembly_conda/flye.log ./conda_flye.log

rm -rf ./assemblies/assembly_conda/*

mv ./conda_assembly.fasta ./assemblies/assembly_conda/
mv ./conda_flye.log ./assemblies/assembly_conda/

conda deactivate
