resource "google_compute_firewall" "monitoramento" {
  name    = "moninoramento-firewall"
  network = google_compute_network.rede-america-norte.id

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22","80","8080","443","3000"]
  }

  source_tags   = ["grafana"]
  source_ranges = ["0.0.0.0/0"]

}