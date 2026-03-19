#!/usr/bin/env bash

module load miniforge3
source "$(conda info --base)/etc/profile.d/conda.sh"

mamba create -n flye-env -c conda-forge -c bioconda flye=2.9.6 -y

conda activate flye-env

flye -v

conda env export --no-builds > flye-env.yml

conda deactivate
