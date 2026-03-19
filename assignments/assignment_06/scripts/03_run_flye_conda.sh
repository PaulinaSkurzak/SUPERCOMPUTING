#!/bin/bash

module load miniforge3
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate flye-env

mkdir -p ./assemblies/assembly_conda

flye --nano-hq ./data/SRR33939694.fastq.gz --meta --threads 6 --out-dir ./assemblies/assembly_conda

mv ./assemblies/assembly_conda/assembly.fasta ./assemblies/assembly_conda/conda_assembly.fasta
mv ./assemblies/assembly_conda/flye.log ./assemblies/assembly_conda/conda_flye.log

rm -f ./assemblies/assembly_conda/assembly_graph.gfa
rm -f ./assemblies/assembly_conda/assembly_graph.gv
rm -f ./assemblies/assembly_conda/assembly_info.txt
rm -f ./assemblies/assembly_conda/params.json

conda deactivate
