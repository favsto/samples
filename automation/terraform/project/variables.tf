variable service_account_path {}

variable "project_id" {
  description = "The project ID you want to use"
}

variable "project_name" {
  description = "The project Name you want to use"
}

variable "organization" {
  description = "The GCP organization domain, example: 'example.org'"
}

variable "folder_id" {
  description = "The folder id where put the project into"
  default = null
}

# variable "billing_account_id" {
#   description = "The Billing Account ID where put the project into"
#   default = null
# }