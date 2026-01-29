# SUPERCOMPUTING

# Assignment 1 – Organizing a project for reproducibility

## Description
This directory contains the project structure for Assignment 1. The goal of this assignment is to practice creating a clean, organized, and reproducible project layout using only Unix command-line tools.

---

## Exact Command Log 

The following commands were executed from the root of the course GitHub repository.

```bash
mkdir -p assignments
cd assignments

mkdir assignment_1
cd assignment_1

mkdir -p data/raw
mkdir -p data/clean
mkdir scripts
mkdir results
mkdir docs
mkdir config
mkdir logs

touch assignment_1_essay.md
touch README.md

touch data/raw/example_raw.txt
touch data/clean/example_clean.txt
touch scripts/example_script.sh
touch results/example_results.txt
touch docs/example_doc.txt
touch config/example_config.txt
touch logs/example.log
