locals {
  web_server_tag = "http-server"
  bucket_name    = "${var.project_id}-web"
}


# Create a Google Compute Firewall rule
resource "google_compute_firewall" "http_server" {
  name    = "default-allow-web-traffic"
  network = "default"

  source_ranges = ["0.0.0.0/0"]

  target_tags = ["${local.web_server_tag}"]

  allow {
    protocol = "tcp"
    ports    = ["8080", "22"]
  }
}

resource "google_storage_bucket" "storage_bucket" {
  name          = "${local.bucket_name}"
  location      = "${var.gcp_region}"
  storage_class = "REGIONAL"
  force_destroy = true // pay attention!
}
resource "google_storage_bucket_object" "web_server_init_script" {
  name       = "terraform/webserver/startup-script.sh"
  source     = "resources/startup-script.sh"
  bucket     = "${local.bucket_name}"
  depends_on = ["google_storage_bucket.storage_bucket"]
}

# Create a Google Compute instance
resource "google_compute_instance" "web_server" {
  name                      = "web-server"
  machine_type              = "g1-small"
  zone                      = "${var.gcp_region}-${var.gcp_zone_letter}"
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "debian-10"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral external IP
    }
  }

  tags = [
    "terraform-example",
    "${local.web_server_tag}"
  ]

  // metadata_startup_script = "echo 'Hello, World' > index.html ; nohup busybox httpd -f -p 8080 &"
  metadata = {
    startup-script-url = "gs://${local.bucket_name}/terraform/webserver/startup-script.sh"
  }

  service_account {
    email = "${var.gce_service_account_email}"
    scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring.write",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/trace.append"
    ]
  }

  depends_on = ["google_storage_bucket_object.web_server_init_script"]
}

# Output variable: Public IP address
output "public_ip" {
  value = "${google_compute_instance.web_server.network_interface.0.access_config.0.nat_ip}"
}