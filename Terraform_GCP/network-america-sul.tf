resource "google_compute_subnetwork" "network-with-secondary-ip-ranges" {
  name          = "rede-subnetwork"
  ip_cidr_range = "192.10.10.0/24"
  region        = "southamerica-east1"
  network       = google_compute_network.rede-america-sul.id
  
}

resource "google_compute_network" "rede-america-sul" {
  name                    = "vpc-america-sul"
  auto_create_subnetworks = false
}