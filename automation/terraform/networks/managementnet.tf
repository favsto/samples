# Create the managementnet network
resource "google_compute_network" "managementnet" {
  name                    = "managementnet"
  auto_create_subnetworks = "false"
}

# Create managementsubnet-us subnetwork
resource "google_compute_subnetwork" "managementsubnet-us" {
  name          = "managementsubnet-us"
  region        = "us-central1"
  network       = google_compute_network.managementnet.self_link
  ip_cidr_range = "10.130.0.0/20"
}

# Create managementsubnet-us subnetwork
resource "google_compute_subnetwork" "managementsubnet-eu" {
  name          = "managementsubnet-eu"
  region        = "europe-west1"
  network       = google_compute_network.managementnet.self_link
  ip_cidr_range = "10.131.0.0/20"
}

# Add a firewall rule to allow HTTP, SSH, and RDP traffic on managementnet
resource "google_compute_firewall" "managementnet-allow-http-ssh-rdp-icmp" {
  name    = "managementnet-allow-http-ssh-rdp-icmp"
  network = google_compute_network.managementnet.self_link
  allow {
    protocol = "tcp"
    ports    = ["22", "80", "3389"]
  }
  allow {
    protocol = "icmp"
  }
}

# Add the managementnet-us-vm instance
module "managementnet-us-vm" {
  source              = "./instance"
  instance_name       = "managementnet-us-vm"
  instance_zone       = "us-central1-a"
  instance_subnetwork = google_compute_subnetwork.managementsubnet-us.self_link
}

# Add the managementnet-us-vm instance
module "managementnet-eu-vm" {
  source              = "./instance"
  instance_name       = "managementnet-eu-vm"
  instance_zone       = "europe-west1-d"
  instance_subnetwork = google_compute_subnetwork.managementsubnet-eu.self_link
}