SERVER_ADDR=%DOCKER.SERVER_ADDR%
IMG_NAME=%DOCKER.IMG_NAME%
# TBD
IMG_TAG=%DOCKER.IMG_TAG%
CHACHEDIR=%DOCKER.CACHE%

# Download the img
mkdir -p $CHACHEDIR
cd $CHACHEDIR

# Compose the image full address
IMG_ADDR=${SERVER_ADDR}:${IMG_TAG}
if [[ -f ${IMG_NAME} ]]
then 
    if [[ `singularity inspect ./${IMG_NAME} | grep from | awk -F':' '{print $3}'` == ${IMG_TAG} ]]
    then
      echo "Img already present"
    else
      # Overwrites the existing img, it's old
      singularity pull -F ${IMG_NAME} docker://${IMG_ADDR} 
    fi
else
  singularity pull ${IMG_NAME} docker://${IMG_ADDR} 
fi