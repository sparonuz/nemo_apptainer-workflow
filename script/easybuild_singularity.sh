#!/bin/bash
PATH_TO_MODULE=/project/AUTOSUBMIT_HPC_PROJECT_NUMBER/AUTOSUBMIT_HPC_USER/modules/LUMI/23.09/partition/L
# If singularity bindings module is not yet built, build it
if  [[ ! -d ${PATH_TO_MODULE}/singularity-bindings ]]
then 
    export EBU_USER_PREFIX=${PATH_TO_MODULE}
    module load LUMI/23.09 partition/common EasyBuild-user

    eb singularity-bindings-system-cpeGNU-23.09-noglibc.eb -r
fi