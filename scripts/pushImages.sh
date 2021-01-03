#!/bin/bash
docker push ${REPOSITORY_PREFIX}/api-gateway${IMAGE_SUFFIX}:latest
docker push ${REPOSITORY_PREFIX}/visits-service${IMAGE_SUFFIX}:latest
docker push ${REPOSITORY_PREFIX}/vets-service${IMAGE_SUFFIX}:latest
docker push ${REPOSITORY_PREFIX}/customers-service${IMAGE_SUFFIX}:latest
docker push ${REPOSITORY_PREFIX}/admin-server${IMAGE_SUFFIX}:latest
docker push ${REPOSITORY_PREFIX}/discovery-service${IMAGE_SUFFIX}:latest
docker push ${REPOSITORY_PREFIX}/config-server${IMAGE_SUFFIX}:latest



