#!/usr/bin/env bash
# local_setup.sh: Copies the runtime environment from the Autosubmit project
# folder to the remote machine

set -xvue
PROJDEST=%PROJECT.PROJECT_DESTINATION%
PROJDIR=%PROJDIR%
HPCARCH=%DEFAULT.HPCARCH%
# 
# Copy Model Sources
# 
cd ${PROJDIR}; cd ..
if [[ -d ${PROJDEST} ]]; then
  tar -zcvf ${PROJDEST}.tar.gz ${PROJDEST}
else
  echo "!!! model not present !!!"
  exit 1
fi

