#!/bin/bash

cd ~/programs

git clone https://github.com/lh3/seqtk.git

cd seqtk

make

echo "export PATH=$PATH:~/programs/seqtk" >> ~/.bashrc
