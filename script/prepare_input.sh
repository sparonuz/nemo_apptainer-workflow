#!/bin/bash
set -xve

INPUT_DIR=%HPCROOTDIR%/INPUT
# Create input dir, to be reused from run to run
mkdir -p ${INPUT_DIR}

if [ ! -s ${INPUT_DIR}/ORCA2_ICE_v4.2.tar  ]; then
  wget https://zenodo.org/records/3767939/files/ORCA2_ICE_v4.2.tar -P ${INPUT_DIR} 
fi
if [ ! -s ${INPUT_DIR}/ORCA2_ICE_v4.2.tar  ]; then
  tar -xf ${INPUT_DIR}/ORCA2_ICE_v4.2.tar  -C ${INPUT_DIR}/
  gunzip ${INPUT_DIR}/*.gz
fi

if [ ! -s ${INPUT_DIR}/INPUTS_PISCES_v4.2.tar ]; then
  wget https://zenodo.org/records/3767939/files/INPUTS_PISCES_v4.2.tar  -P ${INPUT_DIR}
fi
if [ ! -s ${INPUT_DIR}/bathy.orca.nc ]; then
  tar -xf ${INPUT_DIR}/INPUTS_PISCES_v4.2.tar -C ${INPUT_DIR}/
  gunzip ${INPUT_DIR}/*.gz
fi
rm ${INPUT_DIR}/*.tar
