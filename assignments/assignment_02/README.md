# Assignment 2

Paulina Skurzak  
02/04/2026  

On the HPC, the directory structure used for this assignment is:

```
SUPERCOMPUTING/
└── assignments/
    └── assignment_02/
        └── data/
            ├── GCF_000005845.2_ASM584v2_genomic.fna.gz
            └── GCF_000005845.2_ASM584v2_genomic.gff.gz
```

## Task 1: Set Up Semester Workspace on the HPC

Connected to the HPC using SSH and verified that the required directory structure already existed.

**HPC command**
```bash
ssh pskurzak@bora.sciclone.wm.edu
```

Verified directory:
```bash
ls ~/SUPERCOMPUTING/assignments/assignment_02/data
```

---

## Task 2: Download Files from NCBI via Command-Line FTP

Files were retrieved from the NCBI FTP server using anonymous FTP.
After enabling passive mode, directory listing and file transfer succeeded.
The required genomic files were downloaded using the `get` command.
Although the FTP client produced ASCII mode warnings for compressed files,
file sizes matched and integrity was later confirmed using md5sum.

FTP commands used:
```bash
ftp ftp.ncbi.nlm.nih.gov
# login as anonymous
passive
cd genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/
ls
get GCF_000005845.2_ASM584v2_genomic.fna.gz
get GCF_000005845.2_ASM584v2_genomic.gff.gz
bye
```

---

## Task 3: File Transfer and Permissions

The downloaded files were transferred from the local machine to the HPC using
FileZilla via SFTP (port 22). The connection was established to
`bora.sciclone.wm.edu` using the default SSH port, and both files were uploaded
to `~/SUPERCOMPUTING/assignments/assignment_02/data/`.

HPC commands used to verify and update permissions:
```bash
ls -l ~/SUPERCOMPUTING/assignments/assignment_02/data
chmod a+r ~/SUPERCOMPUTING/assignments/assignment_02/data/*.gz
ls -l ~/SUPERCOMPUTING/assignments/assignment_02/data
```

Final permissions:
```text
-rw-r--r-- GCF_000005845.2_ASM584v2_genomic.fna.gz
-rw-r--r-- GCF_000005845.2_ASM584v2_genomic.gff.gz
```

---

## Task 4: Verify File Integrity with md5sum

```bash
# Local Machine MD5 Hashes
md5sum GCF_000005845.2_ASM584v2_genomic.fna.gz
md5sum GCF_000005845.2_ASM584v2_genomic.gff.gz
```

Results:
```text
c13d459b5caa702ff7e1f26fe44b8ad7  GCF_000005845.2_ASM584v2_genomic.fna.gz
2238238dd39e11329547d26ab138be41  GCF_000005845.2_ASM584v2_genomic.gff.gz
```

```bash
# HPC MD5 Hashes
md5sum *.gz
```

Results:
```text
c13d459b5caa702ff7e1f26fe44b8ad7  GCF_000005845.2_ASM584v2_genomic.fna.gz
2238238dd39e11329547d26ab138be41  GCF_000005845.2_ASM584v2_genomic.gff.gz
```

**Result:** The MD5 hashes match for both files, confirming successful transfer without corruption.

---

## Task 5: Create Useful Bash Aliases

The following aliases were added to `~/.bashrc`:

```bash
alias u='cd ..;clear;pwd;ls -alFh --group-directories-first'
alias d='cd -;clear;pwd;ls -alFh --group-directories-first'
alias ll='ls -alFh --group-directories-first'
```

Note: Running `source ~/.bashrc` produced a system-level module warning (`ml()`),
which did not affect alias functionality. The aliases were verified to work as expected.

**Alias descriptions:**
- **ll**: displays a detailed directory listing including hidden files, permissions,
  human-readable sizes, and directories listed first.
- **u**: moves up one directory, clears the terminal, prints the current working directory,
  and displays a detailed listing.
- **d**: returns to the previous directory, clears the terminal, prints the current working
  directory, and displays a detailed listing.

---

## Reflection

This assignment helped me understand how to work between my local machine and the HPC
in a structured and organized way. The hardest part was dealing with FTP behavior and
understanding how network settings affect data connections. Transferring files and
checking permissions showed me how shared computing systems control access to data.
Using md5sum made it clear how to verify that files were transferred correctly.
Next time, I would test network-dependent steps earlier to save time.

