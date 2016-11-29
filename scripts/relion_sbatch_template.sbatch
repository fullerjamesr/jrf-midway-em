#!/bin/bash

# Job name and logs
#SBATCH --job-name=XXXnameXXX
#SBATCH --output=XXXnameXXX.out
#SBATCH --error=XXXnameXXX.err

# Job resources
#SBATCH --partition=XXXqueueXXX
#SBATCH --nodes=XXXnodesXXX
#SBATCH --ntasks-per-node=XXXmpinodesXXX
#SBATCH --cpus-per-task=XXXthreadsXXX

# Need to set these environment vars.
# extra1 = mem-per-cpu
# extra2 = time
#SBATCH --mem-per-cpu=XXXextra1XXX
#SBATCH --time=XXXextra2XXX

#SBATCH --constraint=ib

export OMP_NUM_THREADS=XXXthreadsXXX

# Add my programs to paths
source ~/jrf-midway-em/setup.sh

mpiexec XXXcommandXXX

