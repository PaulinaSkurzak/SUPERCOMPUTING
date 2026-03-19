# Assignment 6: Software and Environments

## Overview

This assignment demonstrates how to run the genome assembler **Flye v2.9.6** using three different software environments:

1. Conda environment  
2. HPC module system  
3. Local manual build  

The purpose is to understand how software environments work, how to manage dependencies, and how to build reproducible pipelines.

---

## Directory Structure
assignment_06/
├── assemblies/
│ ├── assembly_conda/
│ ├── assembly_module/
│ └── assembly_local/
├── data/
├── scripts/
│ ├── 01_download_data.sh
│ ├── flye_2.9.6_conda_install.sh
│ ├── flye_2.9.6_manual_build.sh
│ ├── 03_run_flye_conda.sh
│ ├── 03_run_flye_module.sh
│ └── 03_run_flye_local.sh
├── flye-env.yml
├── pipeline.sh
└── README.md


---

## Dataset

- Accession: **SRR33939694**  
- Type: Oxford Nanopore (ONT) reads  
- Content: Coliphage genomes  
- Downloaded into: `./data/`

---

## Scripts

### 1. Download Data

`scripts/01_download_data.sh`

- Downloads the FASTQ dataset into `./data/`
- Uses `wget` with a fixed filename for reproducibility

---

### 2. Install Flye (Conda)

`scripts/flye_2.9.6_conda_install.sh`

- Loads `miniforge3`
- Creates environment `flye-env`
- Installs Flye v2.9.6
- Exports environment to `flye-env.yml`

---

### 3. Install Flye (Local Build)

`scripts/flye_2.9.6_manual_build.sh`

- Clones Flye into `~/programs/`
- Checks out version 2.9.6
- Compiles locally

---

### 4. Run Flye (Conda)

`scripts/03_run_flye_conda.sh`

- Activates conda environment
- Runs Flye
- Saves results in `assembly_conda/`
- Keeps only:
  - `conda_assembly.fasta`
  - `conda_flye.log`

---

### 5. Run Flye (Module)

`scripts/03_run_flye_module.sh`

- Loads Flye using HPC module
- Runs same command
- Saves results in `assembly_module/`
- Keeps only:
  - `module_assembly.fasta`
  - `module_flye.log`

---

### 6. Run Flye (Local Build)

`scripts/03_run_flye_local.sh`

- Adds local Flye to `$PATH`
- Runs same command
- Saves results in `assembly_local/`
- Keeps only:
  - `local_assembly.fasta`
  - `local_flye.log`

---

## Flye Command
flye --nano-hq ./data/SRR33939694.fastq.gz --meta --threads 6 --out-dir OUTPUT_DIR


### Explanation

- `--nano-hq`: high-quality ONT reads  
- `--meta`: multiple phages possible  
- `--threads 6`: HPC limit  
- `--out-dir`: output location  

---

## Pipeline

Run everything with:
./pipeline.sh


### What it does

1. Downloads the dataset  
2. Builds Flye locally  
3. Creates conda environment  
4. Runs Flye in all 3 environments  
5. Prints last 10 lines of each log file  

---

## Output

After running:
assemblies/
├── assembly_conda/
│ ├── conda_assembly.fasta
│ └── conda_flye.log
├── assembly_module/
│ ├── module_assembly.fasta
│ └── module_flye.log
├── assembly_local/
│ ├── local_assembly.fasta
│ └── local_flye.log


---

## Comparing Results

Log comparison is done using:
tail -n 10 <logfile>


All three methods produced similar results, showing the pipeline is reproducible across environments.

---

## Reflection

### Challenges

One challenge was dealing with file naming issues when downloading the dataset. The file initially included extra characters (`?download=1`), which caused Flye to fail. Fixing this required renaming the file and updating the download script.

Another challenge was understanding how different environments affect execution, especially ensuring the correct environment was activated before running Flye.

---

### What I Learned

- How to use `module load` on HPC systems  
- How to create and manage conda environments  
- How to build software locally  
- How `$PATH` works  
- How to write reproducible and automated pipelines  

---

### Comparing Methods

**Module**
- Simplest to use  
- No setup required  

**Conda**
- Best for reproducibility  
- Environment can be saved and shared  

**Local Build**
- Most control over version  
- More setup required  

---

### Preferred Method

I prefer the **conda environment** because it provides a balance between ease of use and reproducibility.

---

### Future Approach

For future assignments, I will:

1. Check for a module first  
2. Use conda if needed  
3. Use a local build only if necessary  

---

## How to Run

From the main directory:
chmod +x pipeline.sh
./pipeline.sh


This will rebuild everything from scratch without any manual input.
