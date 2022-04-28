provider "google" {
  credentials = "${file("**************.json")}"
  project     = "*********"
  region      = "southamerica-east1"

}

