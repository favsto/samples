#!/bin/bash

# build image
docker build \
    -t eu.gcr.io/$PROJECT_ID/env-node-site:v1 \
    -t eu.gcr.io/$PROJECT_ID/env-node-site:latest \
    .

docker push eu.gcr.io/$PROJECT_ID/env-node-site:v1
docker push eu.gcr.io/$PROJECT_ID/env-node-site:latest