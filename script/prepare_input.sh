#!/bin/bash
set -xve

INPUT_DIR=%HPCROOTDIR%/INPUT
# Create input dir, to be reused from run to run
mkdir -p ${INPUT_DIR}
# ORCA2_ICE_PISCES input files
if [ ! -s  ${INPUT_DIR}/ORCA2_ICE_v4.2.0_LITE.tar.gz ]; then
  curl https://s3.waw3-1.cloudferro.com/swift/v1/ORCA2_ICE_PISCES-input-files/ORCA2_ICE_v4.2.0_LITE.tar.gz --output ${INPUT_DIR}/ORCA2_ICE_v4.2.0_LITE.tar.gz
fi
if [ ! -d ${INPUT_DIR}/ORCA2_ICE_v4.2.0_LITE ]; then
  tar -xzvf ${INPUT_DIR}/ORCA2_ICE_v4.2.0_LITE.tar.gz -C ${INPUT_DIR}/
fi
ln -sf ${INPUT_DIR}/ORCA2_ICE_v4.2.0_LITE/*  ${INPUT_DIR}/

if [ ! -s ${INPUT_DIR}/ORCA2_ICE_v4.2_RC_FULL.tar.gz ]; then
  curl https://s3.waw3-1.cloudferro.com/swift/v1/ORCA2_ICE_PISCES-input-files/ORCA2_ICE_v4.2_RC_FULL.tar.gz --output ${INPUT_DIR}/ORCA2_ICE_v4.2_RC_FULL.tar.gz
fi
if [ ! -d ${INPUT_DIR}/ORCA2_ICE_v4.2_RC_FULL ]; then
  tar -xzvf ${INPUT_DIR}/ORCA2_ICE_v4.2_RC_FULL.tar.gz -C ${INPUT_DIR}/
fi
ln -sf ${INPUT_DIR}/ORCA2_ICE_v4.2_RC_FULL/*  ${INPUT_DIR}/

if [ ! -s ${INPUT_DIR}/ORCA2_PISCES_v4.2_RC_FULL.tar.gz ]; then
  curl "https://thredds-su.ipsl.fr/thredds/fileServer/ipsl_thredds/cetlod/INPUTS_for_NEMO/ORCA2_PISCES/ORCA2_PISCES_v4.2_RC_FULL.tar.gz" --output ${INPUT_DIR}/ORCA2_PISCES_v4.2_RC_FULL.tar.gz
fi
if [ ! -s ${INPUT_DIR}/bathy.orca.nc ]; then
  tar -xzvf ${INPUT_DIR}/ORCA2_PISCES_v4.2_RC_FULL.tar.gz -C ${INPUT_DIR}/
fi
