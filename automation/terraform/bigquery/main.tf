
module "network" {
  source = "./network"

  network_name = "base"
}

# BigQuery
resource "google_bigquery_dataset" "dataset" {
  dataset_id                  = "demo_dataset"
  friendly_name               = "demo_dataset"
  description                 = "This is a demo dataset"
  location                    = "EU"
}

# Storage
resource "google_storage_bucket" "demo-storage-20200303" {
  name     = "demo-storage-20200303"
  location = "EU"
}