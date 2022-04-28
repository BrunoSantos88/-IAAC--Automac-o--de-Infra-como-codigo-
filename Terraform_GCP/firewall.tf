resource "google_compute_firewall" "rules" {
project     = "********"
  name        = "monitoramento"
  network     = "default"
  description = "Creates firewall rule targeting tagged instances rede"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443", "8080", "3000", "9090", "9100", "9100-9199"]

  }

  // Allow traffic from everywhere to instances with an http-server tag
  source_ranges = ["0.0.0.0/0"]
  source_tags   = ["jobs"]
  target_tags   = ["monitoramento"]

}
