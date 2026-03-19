#!/bin/bash

module load Flye/gcc-11.4.1/2.9.6

mkdir -p ./assemblies/assembly_module

flye --nano-hq ./data/SRR33939694.fastq.gz --meta --threads 6 --out-dir ./assemblies/assembly_module

mv ./assemblies/assembly_module/assembly.fasta ./module_assembly.fasta
mv ./assemblies/assembly_module/flye.log ./module_flye.log

rm -rf ./assemblies/assembly_module/*

mv ./module_assembly.fasta ./assemblies/assembly_module/
mv ./module_flye.log ./assemblies/assembly_module/

module unload Flye/gcc-11.4.1/2.9.6

