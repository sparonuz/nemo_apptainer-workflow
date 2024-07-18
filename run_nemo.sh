#!/bin/bash
# Resources definition
NEMO_N_CORES=$1
XIOS_N_CORES=$2
IMG_NAME=$3
RUN_DIR=$4
INPUT_DIR=$5

# Img internal definition
INSTALLDIR="/home/nemo/sources"
NEMO_HOME=${INSTALLDIR}/NEMO
XIOS_HOME=${INSTALLDIR}/XIOS
# Configuration name
CFG_NAME="ORCA2_ICE_PISCES" 

export MODULEPATH=/project/AUTOSUBMIT_HPC_PROJECT_NUMBER/AUTOSUBMIT_HPC_USER/modules/LUMI/23.09/partition/L:$MODULEPATH

module load LUMI/23.09
module load singularity-bindings
# Add further bindings missing from the module load
export SINGULARITY_BIND=/usr/lib64/liblnetconfig.so.4,/usr/lib64/libyaml-0.so.2,/usr/lib64/libnl-genl-3.so.200,/usr/lib64/libnl-3.so.200,/usr/lib64/liblustreapi.so,${SINGULARITY_BIND}

# Bind input output folders
export SINGULARITY_BIND=${RUN_DIR},${INPUT_DIR},${SINGULARITY_BIND}
#srun --partition debug  -A project_465001161 -n 8 singularity run /pfs/lustrep2/scratch/project_465001161/paronuzz/mpi_osu.sif 

srun --ntasks=${NEMO_N_CORES} singularity run --pwd ${RUN_DIR} ${IMG_NAME} ${NEMO_HOME}/cfgs/${CFG_NAME}/EXP00/nemo \
   : --ntasks=${XIOS_N_CORES} singularity run --pwd ${RUN_DIR} ${IMG_NAME} ${XIOS_HOME}/bin/xios_server.exe
