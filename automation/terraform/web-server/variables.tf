variable service_account_path {}

variable "project_id" {
  description = "The project ID you want to use"
}

variable "gce_service_account_email" {
  description = "The Google Compute Engine service account e-mail you want to use"
}

variable "gcp_region" {
  description = "The Region on where create the instance"
}

variable "gcp_zone_letter" {
  description = "The letter related to the Zone in the specified Region on where create the instance"
}
