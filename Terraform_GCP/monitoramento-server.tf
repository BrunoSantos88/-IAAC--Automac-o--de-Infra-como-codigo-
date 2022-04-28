resource "google_compute_instance" "monitoramento" {
  name         = "monitoramento-server"
  machine_type = "e2-standard-4"
  zone         = "southamerica-east1-b"

  boot_disk {
    initialize_params {
      image = "ubuntu-1804-bionic-v20211103"
      size  = 50
      type  = "pd-ssd"
    }
  }

    metadata = {
ssh-keys = "${file("/root/.ssh/google_compute_engine.pub")}"
  }

  network_interface {
  # A default network is created for all GCP projects
  network = "default"
  access_config {
    
  }
}
    metadata_startup_script = "${file("./monitoramento.sh")}" 
  
}
