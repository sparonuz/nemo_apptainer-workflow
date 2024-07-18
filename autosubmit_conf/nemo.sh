set -xvue

# Img definition
IMG_NAME=%DOCKER.CACHE%/%DOCKER.IMG_NAME%
RUN_DIR=%HPCROOTDIR%/WORKDIR
INPUT_DIR=%HPCROOTDIR%/INPUT
NEMO_NN_ITEND=%EXPERIMENT.TS_NUMBER%

# Configuration name
CFG_NAME="ORCA2_ICE_PISCES" 
NEMO_HOME=/home/nemo/sources/NEMO

# Create run directory and make it available to the img
mkdir -p ${RUN_DIR}
export SINGULARITY_BIND=${RUN_DIR}
# cp namelist, because later we need to modify RUN_DIR
singularity run ${IMG_NAME} cp -Lr ${NEMO_HOME}/cfgs/${CFG_NAME}/EXP00/. ${RUN_DIR}/
# link rest of the inputs
ln -sf ${INPUT_DIR}/* ${RUN_DIR}/

# Update namelist parameters
sed -i -e "s/nn_write    =       0/nn_write    =      80/"  ${RUN_DIR}/namelist_ref
sed -i -e "s/nn_itend    =    5840/nn_itend    =    ${NEMO_NN_ITEND}/"  ${RUN_DIR}/namelist_ref

sed -i -e "s/nn_itend    =    5840/nn_itend    =    ${NEMO_NN_ITEND}/"  ${RUN_DIR}/namelist_cfg

sed -i -e 's%<variable id="oasis_codes_id"            type="string" >oceanx</variable>%   %'  ${RUN_DIR}/iodef.xml

cd  %HPCROOTDIR%/git_project

# Internal path: where is the local path internally mapped in the CONTAINER

./run_nemo.sh %EXPERIMENT.NEMO_CORES% %EXPERIMENT.XIOS_CORES% ${IMG_NAME} ${RUN_DIR} ${INPUT_DIR}