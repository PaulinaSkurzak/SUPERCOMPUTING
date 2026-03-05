#!/bin/bash
set -ueo pipefail

# go to programs directory
cd ${HOME}/programs

# download seqkit
wget https://github.com/shenwei356/seqkit/releases/download/v2.10.1/seqkit_linux_amd64.tar.gz

# unpack it
tar -xzf seqkit_linux_amd64.tar.gz

# make executable 
chmod +x seqkit
