#!/bin/bash 
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
#SBATCH --time=1:00:00
#SBATCH --job-name=mpi_job
#SBATCH --output=mpi_output_%j.txt
#SBATCH --mail-type=FAIL
 
cd $SLURM_SUBMIT_DIR
 
module load NiaEnv/2019b
module load intelpython3
source activate nbodykit-env

python LDH_sampling_5e5_mp.py 
python test_os_generator.py
python 9parameters_data_collection_mp.py
