#!/bin/bash
set -ueo pipefail

cd ~/programs

# download gh
wget https://github.com/cli/cli/releases/download/v2.74.2/gh_2.74.2_linux_amd64.tar.gz

# unpack
tar -xzvf gh_2.74.2_linux_amd64.tar.gz

# remove tarball
rm gh_2.74.2_linux_amd64.tar.gz

echo "gh installed in ~/programs/gh_2.74.2_linux_amd64/bin"
