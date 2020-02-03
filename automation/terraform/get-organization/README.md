# What are you building

This demo reads data about a specific GCP organization.

# Steps to run

## Requirements

1.  Terraform installed on your machine
2.  a Service Account with `Resource Manager` > `Organization Viewer` IAM policy on your organization

## Run it

Before starting, edit the file `demo.tfvars` with your preferred data, then prepare your workspace and apply as following. 

```bash
# use a dedicated workspace
terraform workspace new "demo"

# initialize all providers
terraform init

# see what will happen to your project, this will produce a state file called demo.out
terraform plan -var-file="demo.tfvars" -out=demo.out

# apply your plan leveraging the file demo.out
terraform apply "demo.out"

# see the status of your project
terraform show
```

## Clean up

You have nothing to be cleaned up.