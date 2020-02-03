provider "google" {
    credentials = "${file(var.service_account_path)}"
}