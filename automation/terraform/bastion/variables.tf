variable "gcp_project" {}

variable "gcp_region" {
  default = "europe-west1"
}

variable "gcp_zone_letter" {
  description = "type the letter that indicates the zone, valid in your region, such as 'b', 'c', ..."
  default     = "d"
}