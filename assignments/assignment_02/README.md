# Assignment 2

Paulina Skurzak
02/04/2026

On the HPC, the directory structure used for this assignment is: 

SUPERCOMPUTING/
|__assignments/
   |__assignment_02/
      |__data/
	 |__GCF_000005845.2_ASM584v2_genomic.fna.gz
	 |__GCF_000005845.2_ASM584v2_genomic.gff.gz

## Task 1: Set Up Semester Workspace on the HPC 
Connected to the HPC using SSH and verified that the required directory structure already existed.
**HPC command**
```bash
ssh pskurzak@bora.sciclone.wm.edu```

Verified directory:
```bash
ls ~/SUPERCOMPUTING/assignments/assignment_02/data```

## Task 2: Download Files from NCBI via Command-Line FTP
Attempted to retrieve files from the NCBI FTP server using anonymous FTP, but directory listing and file transfer failed due to blocked FTP data connections. 
The files were instead downloaded using HTTPS via curl, which provides equivalent command-line access.

Local commands:
```bash
cd SUPERCOMPUTING/assignments/assignment_02/data

curl -O https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/GCF_000005845.2_ASM584v2_genomic.fna.gz
curl -O https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/GCF_000005845.2_ASM584v2_genomic.gff.gz
```

## Task 3: File Transfer and Permissions
File Transfer to HPC
The downloaded files were transferred from the local machine to the HPC using secure copy (SFTP over port 22).

Local command:
```bash
scp GCF_000005845.2_ASM584v2_genomic*.gz \
pskurzak@bora.sciclone.wm.edu:~/SUPERCOMPUTING/assignments/assignment_02/data/
```

HPC commands:
```bash
ls -l ~/SUPERCOMPUTING/assignments/assignment_02/data
chmod a+r ~/SUPERCOMPUTING/assignments/assignment_02/data/*.gz
ls -l ~/SUPERCOMPUTING/assignments/assignment_02/data
```

Final permissions:
```
-rw-r--r-- GCF_000005845.2_ASM584v2_genomic.fna.gz
-rw-r--r-- GCF_000005845.2_ASM584v2_genomic.gff.gz
```

## Task 4: Verify File Integrity with md5sum
```bash
#Local Machine MD5 Hashes
md5sum GCF_000005845.2_ASM584v2_genomic.fna.gz
md5sum GCF_000005845.2_ASM584v2_genomic.gff.gz
```

Results:`
c13d459b5caa702ff7e1f26fe44b8ad7  GCF_000005845.2_ASM584v2_genomic.fna.gz
2238238dd39e11329547d26ab138be41  GCF_000005845.2_ASM584v2_genomic.gff.gz

#HPC MD5 Hashes
md5sum *.gz

Results: 
c13d459b5caa702ff7e1f26fe44b8ad7  GCF_000005845.2_ASM584v2_genomic.fna.gz
2238238dd39e11329547d26ab138be41  GCF_000005845.2_ASM584v2_genomic.gff.gz
```

Result:  The MD5 hashes match for both files, confirming successful transfer without corruption.

## Task 5: Create Useful Bash Aliases 
The following aliases were added to ~/.bashrc: 

```
alias u='cd ..;clear;pwd;ls -alFh --group-directories-first'
alias d='cd -;clear;pwd;ls -alFh --group-directories-first'
alias ll='ls -alFh --group-directories-first'
```

Note: Running source ~/.bashrc produced a system-level module warning (ml()), which
did not affect alias functionality. The aliases were verified to work as expected.

**Alias descriptions:**
- ll: displays a detailed directory listing including hidden files, permissions,
  human-readable sizes, and directories listed first.
- u: moves up one directory, clears the terminal, prints the current working directory,
  and displays a detailed listing.
- d: returns to the previous directory, clears the terminal, prints the current working
  directory, and displays a detailed listing.

Reflection:
This assignment helped me understand how to work between my local machine and the HPC in a structured and organized way. 
The hardest part was dealing with FTP errors and realizing that some problems were caused by system settings rather than my own mistakes. 
Transferring files and checking permissions showed me how shared systems control access to data. 
Using md5sum made it clear how to confirm that files were transferred correctly. 
Next time, I would check system restrictions and directory paths earlier to save time.
