#!/usr/bin/env bash
set -e

cd ~/SUPERCOMPUTING/assignments/assignment_07

mkdir -p output ref

REF=data/dog_reference/ncbi_dataset/data/GCF_011100685.1/GCF_011100685.1_UU_Cfam_GSD_1.0_genomic.fna

for file in data/clean/*.clean.fastq
do
    base=$(basename "$file" .clean.fastq)

    echo "Mapping $base to dog genome..."

    bbmap.sh \
        in=data/clean/${base}.clean.fastq \
        ref=$REF \
        path=ref \
        out=output/${base}.sam \
        minid=0.95 \
        fastareadlen=1200 \
	maxlen=1200 \
        threads=4 \
        -Xmx60g

    echo "Extracting dog-mapped reads for $base..."
    samtools view -F 4 output/${base}.sam > output/${base}_dog.sam

    echo "Done with $base"
done
