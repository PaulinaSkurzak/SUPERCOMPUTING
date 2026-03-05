# Assignment 05: Bash Pipeline

## Overview

This assignment builds a simple bioinformatics pipeline using Bash scripts.  
The pipeline downloads FASTQ sequencing data and performs quality trimming using the program fastp.

The goal is to automate the workflow so the analysis can be reproduced easily.

---

## Directory Structure

assignment_05/

scripts/  
01_download_data.sh  
02_run_fastp.sh  

data/  
raw/  
trimmed/  

log/  

pipeline.sh  
README.md  

---

## Scripts

### 01_download_data.sh
Downloads FASTQ data, extracts the files, moves them into the data/raw directory, and deletes the tar file.

### 02_run_fastp.sh
Runs fastp on a paired set of reads (R1 and R2) and saves trimmed reads in data/trimmed.

### pipeline.sh
Runs the full workflow:
1. downloads the data  
2. loops through forward read files (_R1_)  
3. runs fastp on each read pair  

---

## Installing fastp

Commands used:

cd ~/programs  
wget http://opengene.org/fastp/fastp  
chmod +x fastp  

Version check:

~/programs/fastp --version

---

## Running the Pipeline

From the assignment_05 directory:

./pipeline.sh

This will:
- download FASTQ data
- run fastp trimming
- save trimmed reads in data/trimmed
- save reports in log

---

## Reflection

### Challenges
Learning how to automatically determine the reverse read file from the forward read filename.

### What I Learned
- installing software on the HPC
- writing bash scripts
- using loops in bash
- building a reproducible pipeline

### Why Use a Pipeline
A pipeline allows the full analysis to be reproduced with one command.

### Pros
automation  
reproducibility  
easy reruns  

### Cons
pipelines can be harder to debug
