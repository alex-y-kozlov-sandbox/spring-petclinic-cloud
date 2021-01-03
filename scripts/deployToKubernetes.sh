#!/bin/bash

if [ -z "${REPOSITORY_PREFIX}" ]
then 
    echo "Please set the REPOSITORY_PREFIX"
else 
    if [ -z "${IMAGE_SUFFIX}" ]
    then 
        echo "Please set the IMAGE_SUFFIX"
    else 
        cat ./k8s/*.yaml | \
        sed 's#\${REPOSITORY_PREFIX}'"#${REPOSITORY_PREFIX}#g" | \
        sed 's#\${IMAGE_SUFFIX}'"#${IMAGE_SUFFIX}#g" | \
        kubectl apply -f -
    fi
fi
