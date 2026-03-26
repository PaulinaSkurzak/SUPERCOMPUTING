# Assignment 7: SLURM Job Submission & Canine Contamination Detection

## Overview

This pipeline searches for dog (*Canis familiaris*) DNA contamination in publicly available shotgun metagenomic Illumina sequencing data. Samples were sourced from a greenhouse potted plant microbiome study (BioProject PRJNA820561) conducted at Guangzhou University, China. The pipeline downloads raw reads, performs quality control, maps reads against the dog reference genome, and extracts any reads that match — revealing potential canine contamination in the lab.

---

## Data Selection

**Search performed on:** NCBI Sequence Read Archive (https://www.ncbi.nlm.nih.gov/sra)

**Search terms used:**
- Organism: `metagenome`
- Library strategy: `WGS`
- Library selection: `RANDOM`
- Platform: `ILLUMINA`
- BioProject: `PRJNA820561` (Greenhouse potted plant microbiome, Guangzhou University)

**Criteria applied:**
- Shotgun metagenome (random library selection, not amplicon)
- Illumina sequencing only (no PacBio or ONT)
- Single-end reads
- 12 samples total (SRR18511654 – SRR18511665)

**Metadata file location:** `data/SraRunTable.csv`

**Accession IDs:**
- SRR18511654
- SRR18511655
- SRR18511656
- SRR18511657
- SRR18511658
- SRR18511659
- SRR18511660
- SRR18511661
- SRR18511662
- SRR18511663
- SRR18511664
- SRR18511665

---

## Directory Structure

```
assignment_07/
├── assignment_7_pipeline.slurm   # SLURM job script
├── README.md
├── data/
│   ├── SraRunTable.csv           # Sample metadata from NCBI Run Selector
│   ├── raw/                      # Raw downloaded .fastq files (not on GitHub)
│   ├── clean/                    # Quality-filtered reads (not on GitHub)
│   └── dog_reference/            # Canis familiaris reference genome
│       └── ncbi_dataset/data/GCF_011100685.1/
│           └── GCF_011100685.1_UU_Cfam_GSD_1.0_genomic.fna
├── output/                       # SAM files and dog-mapped reads + SLURM logs
├── ref/                          # BBMap index (built at runtime)
└── scripts/
    ├── 01_download_data.sh       # Downloads raw reads and dog genome
    ├── 02_clean_reads.sh         # QC filtering with fastp
    └── 03_map_reads.sh           # BBMap mapping + samtools extraction
```

---

## Software Requirements

All tools should be installed in `~/programs/` before running.

| Tool | Version | Purpose |
|------|---------|---------|
| fasterq-dump (sra-toolkit) | 3.4.0 | Download raw reads from SRA |
| datasets (ncbi-datasets) | latest | Download reference genome |
| fastp | 1.1.0 | Read QC and adapter trimming |
| BBMap | 39.01 | Map reads to dog reference genome |
| samtools | 1.22 | Extract mapped reads from SAM files |

**Installation paths expected:**
```
~/programs/sratoolkit.3.4.0-ubuntu64/bin/fasterq-dump
~/programs/datasets
~/programs/bbmap/bbmap.sh
~/programs/samtools/bin/samtools
~/programs/fastp
```

---

## How to Run the Pipeline

1. Upload your `SraRunTable.csv` metadata file to `data/` — the first column must be named `Run` and contain SRA accession IDs.

2. Make sure all tools are installed and your `~/.bashrc` exports the correct PATH:
```bash
export PATH=$HOME/programs:$HOME/programs/bbmap:$HOME/programs/samtools/bin:$HOME/programs/sratoolkit.3.4.0-ubuntu64/bin:$PATH
```

3. Submit the SLURM job from the `assignment_07/` directory:
```bash
sbatch assignment_7_pipeline.slurm
```

4. Monitor progress:
```bash
squeue -u $USER
tail -f output/assignment7.err
```

The pipeline will automatically run all three scripts in order:
- `01_download_data.sh` — downloads all SRA accessions and the dog reference genome
- `02_clean_reads.sh` — quality filters all raw reads with fastp
- `03_map_reads.sh` — maps clean reads to dog genome, extracts hits

**Output files:**
- `output/SRRXXXXXXX.sam` — full alignment output
- `output/SRRXXXXXXX_dog.sam` — only reads that mapped to dog genome
- `output/assignment7.out` — SLURM stdout log
- `output/assignment7.err` — SLURM stderr log (pipeline progress)

---

## SLURM Resource Allocation

| Parameter | Value |
|-----------|-------|
| Partition | hima |
| Memory | 64G |
| CPUs | 4 |
| Time limit | 8 hours |
| Node used | hi02 / hi05 |

BBMap requires substantial memory to load and index the dog reference genome (~2.4 GB FASTA). `-Xmx60g` is passed to the JVM to allow up to 60GB heap space.

---

## QC Parameters (fastp)

Default fastp parameters were used for all samples:
- Adapter auto-detection: enabled
- Quality filtering: enabled (default Q15)
- Length filtering: enabled (default minimum 15bp)
- Per-base quality trimming: enabled

All 12 samples passed QC with 100% Q20 and Q30 rates, and 0% adapter content detected, suggesting the data was already pre-processed upstream.

---

## Mapping Parameters (BBMap)

- Reference genome: *Canis familiaris* GCF_011100685.1 (UU_Cfam_GSD_1.0)
- Minimum alignment identity: `minid=0.95` (95%)
- Max read length: `maxlen=1200`, `fastareadlen=1200`
- Threads: 4
- JVM memory: `-Xmx60g`
- Index stored in: `ref/` (built on first sample, reused for all subsequent samples)

Reads were extracted using:
```bash
samtools view -F 4 input.sam > output_dog.sam
```
The `-F 4` flag excludes unmapped reads, retaining only reads with a significant alignment to the dog genome.

---

## Results

| Sample | QC Reads | Reads Mapped to Dog Genome |
|--------|----------|---------------------------|
| SRR18511654 | 971,499 | TBD |
| SRR18511655 | 981,774 | TBD |
| SRR18511656 | 1,017,947 | TBD |
| SRR18511657 | 901,574 | TBD |
| SRR18511658 | 1,140,467 | TBD |
| SRR18511659 | 699,674 | TBD |
| SRR18511660 | 959,680 | TBD |
| SRR18511661 | 878,420 | TBD |
| SRR18511662 | 986,896 | TBD |
| SRR18511663 | 902,046 | TBD |
| SRR18511664 | 1,108,612 | TBD |
| SRR18511665 | 1,005,464 | TBD |

*Note: Dog-mapped read counts marked TBD — pipeline did not complete successfully due to a BBMap read length error (reads exceeding internal fastareadlen limit). The fix (adding `maxlen=1200`) has been applied to the final version of `03_map_reads.sh` but the full pipeline run was not completed before submission.*

---

## Reflection

### Challenges

The most significant challenge in this assignment was debugging the BBMap read length error. The tool kept crashing with `java.lang.AssertionError: Read N, length 617, exceeds the limit of 600`, even after setting `fastareadlen=1200` in the command. The issue turned out to be that BBMap has an internal hardcoded default of 500 that takes precedence at JVM startup — passing `fastareadlen` as a regular parameter was not enough. The fix was to also pass `maxlen=1200` to handle long reads at the threading level.

A second challenge was index corruption caused by accidentally submitting two SLURM jobs at the same time. Both jobs tried to write the BBMap index to the same `ref/` directory simultaneously, which corrupted the index and caused a cryptic `java.lang.AssertionError: 1, 0, [0, 0, 0, 0, 0, 0]` error. The fix was to always cancel running jobs before resubmitting, and to delete the `ref/` directory before each fresh run.

Other smaller issues included: a stray `k` character at the beginning of `01_download_data.sh` before the shebang line, a typo in the directory path (`assignment_7` vs `assignment_07`), and the `datasets` tool not being in PATH until manually downloaded and added to `~/.bashrc`.

### New Things Learned

- How to write and submit SLURM job scripts with `sbatch`, and monitor them with `squeue`, `sacct`, and `scancel`
- How to interpret SLURM `.out` and `.err` log files to debug pipeline failures
- How BBMap indexes a reference genome and why memory allocation (`-Xmx`) matters for large genomes
- That `path=ref` in BBMap saves the index to disk so it only needs to be built once per loop, dramatically speeding up multi-sample runs
- How `samtools view -F 4` uses SAM flags to filter for mapped reads only
- How to use `fasterq-dump` to download SRA data and `datasets` to download NCBI reference genomes from the command line
- The practical reality that pipelines rarely work on the first try — reading error logs carefully and searching for the specific exception message is the most efficient debugging approach
