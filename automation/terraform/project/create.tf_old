module "project-factory" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 2.0"

  name                = "pf-test-1"
  random_project_id   = "true"
  org_id              = "1234567890"
  usage_bucket_name   = "pf-test-1-usage-report-bucket"
  usage_bucket_prefix = "pf/test/1/integration"
  billing_account     = "ABCDEF-ABCDEF-ABCDEF"
  shared_vpc          = "shared_vpc_host_name"

  shared_vpc_subnets = [
    "projects/base-project-196723/regions/us-east1/subnetworks/default",
    "projects/base-project-196723/regions/us-central1/subnetworks/default",
    "projects/base-project-196723/regions/us-central1/subnetworks/subnet-1",
  ]
}