#!/usr/bin/env bash

bash ./scripts/01_download_data.sh
bash ./scripts/flye_2.9.6_manual_build.sh
bash ./scripts/flye_2.9.6_conda_install.sh

bash ./scripts/03_run_flye_conda.sh
bash ./scripts/03_run_flye_module.sh
bash ./scripts/03_run_flye_local.sh

echo "=== CONDA LOG ==="
tail -n 10 ./assemblies/assembly_conda/conda_flye.log

echo
echo "=== MODULE LOG ==="
tail -n 10 ./assemblies/assembly_module/module_flye.log

echo
echo "=== LOCAL LOG ==="
tail -n 10 ./assemblies/assembly_local/local_flye.log
