# Assignment 4: Bash Scripts and Program PATHs

Name: Paulina Skurzak
Date: 02/25/2026

## Description
This assignment had us writing bash scripts to install programs and automate
tasks on the HPC. Most of the actual work happened outside of assignment_4/
in the ~/programs/ directory since that's where the software was installed.

### Task 1: Programs Directory
Made a ~/programs/ directory to keep installed software. On the HPC you can't
install things in the usual system directories because you don't have admin
permissions, so this is the workaround.

### Task 2 & 3: Installing gh
Downloaded the gh tarball from GitHub and unpacked it into ~/programs/. Then
wrote a script to automate that whole process so it could be repeated easily.
Script is saved at ~/programs/install_gh.sh.

### Task 4: Adding gh to $PATH
Added the gh binary location to ~/.bashrc so the shell can find it from
anywhere without typing the full path every time.

### Task 5: GitHub Authentication
Ran gh auth login to connect my GitHub account to the HPC so I can push and
pull from here using a personal access token.

### Task 6: Installing seqtk
Cloned the seqtk repo into ~/programs/seqtk and compiled it with make. Wrote
an install script for this too at ~/programs/install_seqtk.sh. The last line
of that script echoes the PATH update into ~/.bashrc so seqtk is accessible
from anywhere.

### Task 7: Exploring seqtk
Played around with seqtk on the Arabidopsis genome file from assignment 3.
The most useful command for this assignment was:

seqtk comp file.fna

It gives you a table of every sequence in the file with its name, length, and
nucleotide counts.

### Task 8: summarize_fasta.sh
Wrote a script that takes a fasta file as input and prints out the total number
of sequences, total nucleotides, and a name/length table using seqtk comp.
Stored in assignments/assignment_04/summarize_fasta.sh.

### Task 9: Running it in a loop
Used copies of the Arabidopsis genome as test files and ran summarize_fasta.sh
on all of them at once with:

for file in ~/SUPERCOMPUTING/assignments/assignment_04/data/*.fna; do
    bash ~/SUPERCOMPUTING/assignments/assignment_04/summarize_fasta.sh $file
done

## Reflection

This assignment was harder than the previous ones. Writing scripts from scratch
was completely new to me and it took a while to get the logic right, especially
understanding positional arguments like $1 and how the script actually receives
a filename.

I also ran into merge conflicts again when trying to push to GitHub, which I'm
getting more comfortable resolving but still find a little stressful. There was
also a weird error when running source ~/.bashrc on the HPC that I couldn't
fully explain, but seqtk still worked so I moved on.

$PATH is basically a list of folders that the shell searches through whenever
you type a command. So when I type seqtk, the shell just checks each folder in
$PATH until it finds the seqtk program. Before I added ~/programs/seqtk to
$PATH, I would have had to type the full path every time. Adding it to
~/.bashrc means it's set automatically every time I log in.
