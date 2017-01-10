#!/bin/bash

# Job name and logs
#SBATCH --job-name=XXXnameXXX
#SBATCH --output=XXXnameXXX.out
#SBATCH --error=XXXnameXXX.err

# Job resources
#SBATCH --partition=gpu
#SBATCH --gres=gpu:XXXqueueXXX
#SBATCH --constraint=k20m|k40m
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=XXXthreadsXXX

# Need to set these environment vars.
# extra1 = mem-per-cpu
# extra2 = time
#SBATCH --mem-per-cpu=XXXextra1XXX
#SBATCH --time=XXXextra2XXX

export OMP_NUM_THREADS=XXXthreadsXXX

# Add my programs to paths
source ~/jrf-midway-em/setup.sh

XXXcommandXXX

