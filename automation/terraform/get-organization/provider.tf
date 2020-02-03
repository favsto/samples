# Configure the Google Cloud provider
provider "google" {
  credentials = "${file(var.service_account_path)}"
}