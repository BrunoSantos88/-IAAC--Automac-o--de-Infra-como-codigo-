resource "google_compute_firewall" "elastic-firewall" {
  name    = "firewall-elastic"
  network = google_compute_network.rede-america-sul.id

  allow {
    protocol = "icmp"
  }
  
  allow {
    protocol = "tcp"
    ports    = ["22","80","3000","3306","5044","5432","9200","9300"]
    
  }

  source_tags   = ["elastic","grafana","banco"]
  source_ranges = ["0.0.0.0/0"]

}