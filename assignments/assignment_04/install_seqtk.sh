#!/bin/bash
set -ueo pipefail
cd ~/programs
# clone seqtk
git clone https://github.com/lh3/seqtk.git
# compile
cd seqtk
make
# add seqtk to PATH
echo "export PATH=$PATH:~/programs/seqtk" >> ~/.bashrc
echo "seqtk installed in ~/programs/seqtk"
