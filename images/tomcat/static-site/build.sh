#!/bin/bash

#compile, test, package
mvn clean package

# build image
docker build \
    -t eu.gcr.io/$PROJECT_ID/tomcat-static-site:v1 \
    -t eu.gcr.io/$PROJECT_ID/tomcat-static-site:latest \
    .
