#!/bin/bash
set -xve

INPUT_DIR=%HPCROOTDIR%/INPUT
# Create input dir, to be reused from run to run
mkdir -p ${INPUT_DIR}

for FILE_NAME in ORCA2_ICE_v4.2 INPUTS_PISCES_v4.2
do 
  if [ ! -f ${INPUT_DIR}/${FILE_NAME}.tar  ]; then
    wget https://zenodo.org/records/3767939/files/${FILE_NAME}.tar -P ${INPUT_DIR}
  fi
  if [ ! -d ${INPUT_DIR}/${FILE_NAME}  ]; then
    mkdir ${INPUT_DIR}/${FILE_NAME}
    tar -xf ${INPUT_DIR}/${FILE_NAME}.tar  -C ${INPUT_DIR}/${FILE_NAME}
    gunzip ${INPUT_DIR}/${FILE_NAME}/*.gz
    ln -s ${INPUT_DIR}/${FILE_NAME}/*.nc ${INPUT_DIR}
  fi
done
# rm ${INPUT_DIR}/*.tar
