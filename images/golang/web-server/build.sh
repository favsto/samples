#!/bin/bash

# build image
docker build \
    -t eu.gcr.io/$PROJECT_ID/hello-app:v1 \
    -t eu.gcr.io/$PROJECT_ID/hello-app:latest \
    .

docker push eu.gcr.io/$PROJECT_ID/hello-app:v1
docker push eu.gcr.io/$PROJECT_ID/hello-app:latest