# What are you building

Your solution will contains:
* a custom network
* a bigquery dataset
* a custom bucket

# Steps to run

## Requirements

1. Terraform installed on your machine
4. Google Cloud SDK (`gcloud`) installed on your machine, authorized with your user: [guide](https://cloud.google.com/sdk/gcloud/reference/auth/application-default/login)
2. a GCP project with an active Billing Account 
3. APIs enabled:
    * Google Cloud Storage
    * Google BigQuery
    * Google Compute Engine

## 1. Preparation

Authorize `gcloud` to have a valid token useful for your terraform:

```bash
gcloud auth application-default login
# follow the steps via browser
```


## 2. Build it

Before starting, edit the file `staging.tfvars` with your project id, then prepare your workspace and apply as following. 

```bash
# use a dedicated workspace
terraform workspace new "staging"

# initialize all providers
terraform init

# see what will happen to your project, this will produce a state file called staging.out
terraform plan -out=staging.out

# apply your plan leveraging the file staging.out
terraform apply "staging.out"

# see the status of your project
terraform show
```

## 4. Clean up

```bash
# Warning: this will destroy everything you created before. You wont be able to undo it!
terraform destroy -auto-approve
```