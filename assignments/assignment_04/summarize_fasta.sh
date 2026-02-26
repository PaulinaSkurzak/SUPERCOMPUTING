#!/bin/bash
set -ueo pipefail

fasta=$1

echo "File: $fasta"

# number of sequences
num_seqs=$(grep -c "^>" "$fasta")

# total nucleotides
total_nt=$(grep -v "^>" "$fasta" | tr -d '\n' | wc -c)

echo "Total sequences: $num_seqs"
echo "Total nucleotides: $total_nt"

echo ""
echo "Sequence names and lengths:"

seqtk comp "$fasta" | awk '{print $1 "\t" $2}'
