#!/bin/bash
#
# motioncor2.sbatch
#
# Usage:
#	sbatch [--job-name=SOME_NAME --time=HR:MIN:SEC] motioncor2.sbatch [COMMANDS PASSED TO MotionCor2 executable]
#
#	[Brackets denote optional]
#
# Submits a job to run MotionCor2 with the specified parameters
# Motioncor2 takes < 1 minute to process a Falcon/K2 sized images so the whole thing can be one job where images are processed serially
#

#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=2000
#SBATCH --constraint=k20m|k40m

export OMP_NUM_THREADS=4

source ~/jrf-midway-em/setup.sh

MotionCor2-10-19-2016 "$@"

