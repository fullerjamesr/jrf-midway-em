#!/bin/bash
#
# motioncorr_directory.sbatch
#
# Usage:
#	sbatch [--job-name=SOME_NAME --time=HR:MIN:SEC] motioncorr_directory.sbatch /path/to/micrograph/folder/ ["COMMANDS FOR MOTIONCORR"]
#	Brackets denote optional
#
# Submits a job to run motioncorr over all .mrc files in a specificed dir
# motioncorr takes < 1 minute to process a Falcon/K2 sized images so the whole thing can be one job where images are processed serially
# motioncorr appears to max out at 4 threads and 1 GPU
#
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=2000

source ~/jrf-midway-em/setup.sh

cd $1

for FILE in *.mrc
do
	echo $FILE
	dosefgpu_driftcorr $FILE $2
done

