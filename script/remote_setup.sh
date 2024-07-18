#!/usr/bin/env bash
# remote_setup.sh: Connectos to the remote machine and untar your project. Then deletes the tar file 

CURRENT_ROOTDIR=%CURRENT_ROOTDIR%
PROJECT_DESTINATION=%PROJECT.PROJECT_DESTINATION%
#
# Extract Model Sources
#
echo `pwd`

cd ${CURRENT_ROOTDIR}
# Check sources exist
if [ ! -f ${PROJECT_DESTINATION}.tar.gz ]; then
  echo ${PROJECT_DESTINATION}.tar.gz not found!
  exit 1
fi
tar -xvf ${PROJECT_DESTINATION}.tar.gz
# Now that everything is done, remove the tar file
rm ${PROJECT_DESTINATION}.tar.gz
