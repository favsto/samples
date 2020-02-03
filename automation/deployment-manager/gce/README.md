# Deployment Manager - GCE basics

This demo creates a VPC custom network with GCE instances.

## Requirements

1. gcloud configured

## Steps

1. clone this repository
1. run `gcloud deployment-manager deployments create gcebasics --config=config.yaml`

## Clean up

**WARNING**: This will destroy the whole GCP resources created by this lab.

Run: `gcloud deployment-manager deployments delete gcebasics`
