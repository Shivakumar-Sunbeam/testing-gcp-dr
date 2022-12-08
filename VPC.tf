data "google_project" "kubernetes-labs" {
  project_id = "mytestlab-356007"
}


resource "google_compute_network" "my-test-vnet" {
  project                 = data.google_project.kubernetes-labs.project_id
  name                    = "test"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "my-test-subnet" {
  project = data.google_project.kubernetes-labs.project_id
  name          = "test-subnet"
  ip_cidr_range = "10.1.0.0/16"
  region        = "europe-west1"
  network       = google_compute_network.my-test-vnet.id
  
}

resource "google_compute_subnetwork" "my-test-jump-host-subnet" {
  project = data.google_project.kubernetes-labs.project_id
  name          = "test-jump-host-subnet"
  ip_cidr_range = "10.2.0.0/16"
  region        = "europe-west1"
  network       = google_compute_network.my-test-vnet.id
  
  
}