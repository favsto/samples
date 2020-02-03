# Getting started with Terraform and GCP

## Reference guides

-   [Official HashiCorp website](https://www.terraform.io/docs/providers/google/index.html)
-   [Google Cloud Community](https://cloud.google.com/community/tutorials/managing-gcp-projects-with-terraform)

## Installation

The way I love the most is via Docker:

```bash
docker run -v /terraform:/software sethvargo/hashicorp-installer terraform 0.12.8

# consider adding it into your PATH

# try it
terraform -h
```

If you don't like it you can [download the binary](https://www.terraform.io/downloads.html), copy it in a folder and use it. 

# Examples and demos

| name                | link                          | description                                                       |
| :------------------ | :---------------------------- | :---------------------------------------------------------------- |
| Bastion             | [link](./bastion)             | 2 networks with a Bastion Host, a private VM and a Cloud NAT      |
| Generate Project ID | [link](./generate-project-id) | Generate a string with a random string valid for a GCP project ID |
| Get Organization    | [link](./get-organization)    | Given an organization domain returns its data on GCP              |
| Networks            | [link](./networks)            | Create 2 networks with some VMs, leveraging Terraform modules     |
| Project             | [link](./project)             | Create a project into a GCP org                                   |
| Web Server          | [link](./web-server)          | A simple GCE webserver with a startup script hosted in GCS        |

# Run code

## Configuration

Create a service-account.json file. [Reference guide](https://www.terraform.io/docs/providers/google/provider_reference.html).

## Play

```bash
cd  # or whatever example subfolder

# ...follow the readme within each subfolder
```