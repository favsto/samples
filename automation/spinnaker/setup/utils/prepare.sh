#!/bin/bash

ADDRESS=eu.gcr.io
SERVICE_ACCOUNT_NAME=spinnaker-account
SERVICE_ACCOUNT_DEST=/home/spinnaker/.gcp/service-account.json
mkdir -p $(dirname $SERVICE_ACCOUNT_DEST)
SA_EMAIL=$(gcloud iam service-accounts list \
    --filter="displayName:$SERVICE_ACCOUNT_NAME" \
    --format='value(email)')
PROJECT=$(gcloud config get-value project)