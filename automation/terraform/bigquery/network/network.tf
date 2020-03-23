resource "google_compute_network" "base" {
  name                    = var.network_name
  auto_create_subnetworks = "false"
}

# Create base-us subnetwork
resource "google_compute_subnetwork" "base-us" {
  name          = var.network_name
  region        = "us-central1"
  network       = google_compute_network.base.self_link
  ip_cidr_range = "10.130.0.0/20"
}

# Create base-eu subnetwork
resource "google_compute_subnetwork" "base-eu" {
  name          = var.network_name
  region        = "europe-west1"
  network       = google_compute_network.base.self_link
  ip_cidr_range = "10.131.0.0/20"
}

# Add a firewall rule to allow SSH
resource "google_compute_firewall" "base-allow-ssh" {
  name    = "${var.network_name}-allow-ssh"
  network = google_compute_network.base.self_link
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

# Add a firewall rule to allow ICMP
resource "google_compute_firewall" "base-allow-icmp" {
  name    = "${var.network_name}-allow-icmp"
  network = google_compute_network.base.self_link

  allow {
    protocol = "icmp"
  }
}

# Add a firewall rule to allow ICMP
resource "google_compute_firewall" "base-allow-internal" {
  name    = "${var.network_name}-allow-internal"
  network = google_compute_network.base.self_link

  source_ranges = ["10.131.0.0/18"]

  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
  }
  allow {
    protocol = "udp"
  }
}