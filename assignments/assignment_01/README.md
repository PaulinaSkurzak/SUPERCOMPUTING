# Assignment 1:  Organizing a project for reproducibility 

## Command Log

The following commands were used to create the project structure for this assignment.

cd ~/SUPERCOMPUTING/assignments
mkdir assignment_01
cd assignment_01

mkdir -p data/raw data/clean scripts results docs config logs 

touch README.md
touch assignment_01_essay.md

touch data/raw/example_raw.txt
touch data/clean_example_clean.txt
touch scripts/example.sh
touch results/example_result.txt
touch docs/example_notes.txt
touch config/example_config.txt
tough logs/example.log 

# Notes 

The project is organized to separate raw data, processed data, scripts, and results.

All directories contain placeholder files so they are tracked by Git.

Relative paths are used to support reproducibility across systems. 
