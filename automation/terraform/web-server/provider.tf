# Configure the Google Cloud provider
provider "google" {
  credentials = "${file(var.service_account_path)}"
  project     = "${var.project_id}"
  region      = "${var.gcp_region}-${var.gcp_zone_letter}"
}