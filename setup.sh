#!/bin/bash

# Load modules required by various programs
module load jbigkit
module load wxwidgets/3.0
module load cuda/7.5
module load intelmpi/5.0+intel-15.0
module load python

# Add subdirs to shell vars
#  ...but first need the path to here [not presently resilient to symlinks]
SOURCE="${BASH_SOURCE[0]}"
MYDIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
export JRF_EM_ROOT=$MYDIR
export PATH=$MYDIR/bin:$PATH
export PATH=$MYDIR/scripts:$PATH
export LD_LIBRARY_PATH=$MYDIR/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=$MYDIR/lib:$LIBRARY_PATH


# Relion specific
if [ "$1" = "gpu" ]
then
	export export RELION_QSUB_TEMPLATE=$MYDIR/scripts/relion_sbatch_gpu_template.sbatch
else
	export RELION_QSUB_TEMPLATE=$MYDIR/scripts/relion_sbatch_template.sbatch
fi
export RELION_QSUB_EXTRA1="RAM per thread (MB)"
export RELION_QSUB_EXTRA1_DEFAULT=2000
export RELION_QSUB_EXTRA2="Time (hr:min:sec)"
export RELION_QSUB_EXTRA2_DEFAULT="02:00:00"

export RELION_MOTIONCORR_EXECUTABLE=$MYDIR/bin/dosefgpu_driftcorr
export RELION_UNBLUR_EXECUTABLE=$MYDIR/bin/unblur
export RELION_SUMMOVIE_EXECUTABLE=$MYDIR/bin/sum_movie
export RELION_CTFFIND_EXECUTABLE=$MYDIR/bin/ctffind
export RELION_RESMAP_EXECUTABLE=$MYDIR/bin/ResMap-1.1.4-linux64

