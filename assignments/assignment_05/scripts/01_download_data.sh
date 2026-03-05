#!/bin/bash
set -euo pipefail

# download the data tarball
wget https://gzahn.github.io/data/fastq_examples.tar

# extract the tar file
tar -xf fastq_examples.tar

# move fastq files into raw data folder
mv *.fastq.gz data/raw/

# remove the tar file
rm fastq_examples.tar
