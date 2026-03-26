#!/usr/bin/env bash
#SBATCH --job-name=assignment7_map
#SBATCH --output=/sciclone/home/pskurzak/SUPERCOMPUTING/assignments/assignment_07/output/assignment7.out
#SBATCH --error=/sciclone/home/pskurzak/SUPERCOMPUTING/assignments/assignment_07/output/assignment7.err
#SBATCH --time=08:00:00
#SBATCH --mem=64G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4

export PATH=$HOME/programs:$HOME/programs/bbmap:$HOME/programs/samtools/bin:$HOME/programs/sratoolkit.3.4.0-ubuntu64/bin:$PATH

cd ~/SUPERCOMPUTING/assignments/assignment_07

bash scripts/01_download_data.sh
bash scripts/02_clean_reads.sh
bash scripts/03_map_reads.sh
