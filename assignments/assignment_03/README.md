# Assignment 3: Exploring DNA Sequence File with Command Line Tools

Name: Paulina Skurzak
Date: 02/18/2026 

## Assignment 3 Description 
In this assignment, I explored a genomic FASTA file using Linux command-line tools. The tasks involved:

- Navigating directories on the HPC
- Downloading and uncompressing a `.fna.gz` file
- Counting FASTA headers (number of sequences)
- Counting total nucleotides
- Counting total lines in the file
- Searching for specific keywords in headers (e.g., chromosome, mitochondrion)
- Examining specific sequence lines
- Identifying patterns in DNA sequences
- Separating headers and sequences into separate files
- Combining data into a tab-separated (.tsv) file

The goal of the assignment was to practice using command-line tools to analyze biological sequence data efficiently.

## Directory Structure 
The assignment was completed inside:

SUPERCOMPUTING/assignments/assignment_03/

The directory contains:

assignment_03/
├── README.md
├── GCF_000001735.4_TAIR10.1_genomic.fna
├── headers.txt
├── sequences.txt
└── GCF_000001735.4_TAIR10.1_genomic.tsv

All file names contain no spaces and are stored in the correct directory.
├── data/
│   └── GCF_000001735.4_TAIR10.1_genomic.fna

## Setup

Navigate to assignment directory:

```bash
cd ~
cd SUPERCOMPUTING
cd assignments
cd assignment_03

wget https://gzahn.github.io/data/GCF_000001735.4_TAIR10.1_genomic.fna.gz

gunzip GCF_000001735.4_TAIR10.1_genomic.fna.gz

F=GCF_000001735.4_TAIR10.1_genomic.fna

#1 Count number of sequences:  
grep -c '^>' "$F"

#2 Count total nucleotides:
grep -v '^>' "$F" | wc -c

#3 Count total lines: 
wc -l "$F"

#4: Count mitochondrial sequences: 
grep '^>' "$F" | grep -c 'mitochondrion'

#5 Count chromosome sequences: 
grep '^>' "$F" | grep -c 'chromosome'

#6 Count characters in first three sequences lines: 
grep -v '^>' "$F" | head -n 1 | wc -c
grep -v '^>' "$F" | head -n 2 | tail -n 1 | wc -c
grep -v '^>' "$F" | head -n 3 | tail -n 1 | wc -c

#7: Count characters in 5th sequence line: 
grep -v '^>' "$F" | head -n 5 | tail -n 1 | wc -c

#8 Count lines with 16 consecutive A's:
grep -v '^>' "$F" | grep -c 'AAAAAAAAAAAAAAAA'

#9 Sort headers and show first: 
grep '^>' "$F" | sort | head -n 1

#10 Create TSV file:
grep '^>' "$F" > headers.txt
grep -v '^>' "$F" > sequences.txt
paste headers.txt sequences.txt > GCF_000001735.4_TAIR10.1_genomic.tsv
<<<<<<< HEAD
=======
```
>>>>>>> 216e7575dd838659b812434822cac2c8a1fed2ff

## Reflection 
For this assignment, my approach was to break each question into small, testable commands and run them step by step in the terminal. Before writing anything into the README, I verified that each command produced the expected type of output. I found that setting a file variable (`F=...`) at the beginning made the workflow cleaner, reduced repetition, and minimized path-related errors. It also made the overall process much easier to manage when running multiple commands on the same file.

One of the main things I learned was how powerful simple command-line tools can be when combined using pipes. Individually, commands like `grep`, `wc`, `head`, and `tail` seem basic, but chaining them together allows for detailed analysis of large biological data files. I also developed a better understanding of FASTA file structure, particularly how headers are distinguished from sequence lines and how pattern matching can be used to separate them efficiently.

Some tools were slightly frustrating at first. I had to be careful with quotes and variable usage (`"$F"`), since small mistakes can cause commands to fail or behave unexpectedly. It required attention to detail and precision in typing. However, working through these challenges helped me better understand how the shell interprets commands and processes input.

These skills are essential in computational work because real-world datasets are often extremely large, and graphical interfaces are not practical for processing them. The ability to quickly search, filter, count, and manipulate text data directly from the command line supports efficient and reproducible analysis. In fields such as bioinformatics, genomics, data science, and high-performance computing, this fluency is foundational. It enables automation, scripting, and integration into larger computational workflows.

In the future, this entire analysis could be automated by writing a shell script that runs all commands sequentially and outputs the results to a summary file. Automating the workflow would improve reproducibility and reduce the possibility of human error.
