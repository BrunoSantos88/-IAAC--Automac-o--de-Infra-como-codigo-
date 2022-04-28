resource "google_compute_network_peering" "peering1" {
  name         = "peering1"
  network      = google_compute_network.rede-america-norte.id
  peer_network = google_compute_network.rede-america-sul.id
  
  import_custom_routes = true
  export_custom_routes = true

}

resource "google_compute_network_peering" "peering2" {
  name         = "peering2"
  network      = google_compute_network.rede-america-sul.id
  peer_network = google_compute_network.rede-america-norte.id

  import_custom_routes = true
  export_custom_routes = true
  
}