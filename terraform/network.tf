resource "google_compute_network" "vpc" {
  name                    = "vpc"
  project                 = "alaa-368700"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
  mtu                      = 1500
}




#create management subnet for VM
resource "google_compute_subnetwork" "public-subnet" {
  name          = "management-subnet"
  project       = "alaa-368700"
  ip_cidr_range = "10.0.0.0/24"
  region        = "us-west1"
  network       = google_compute_network.vpc.id
}

#create restricted subnet for GKE
resource "google_compute_subnetwork" "private-subnet" {
  project       = "alaa-368700"
  name          = "restricted-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-west1"
  network       = google_compute_network.vpc.id

  #allow private google access to communicate with gcp resources
  private_ip_google_access = true
  secondary_ip_range {
    range_name = "pod-ip-range"
    ip_cidr_range = "10.0.11.0/24"
  }
  secondary_ip_range {
    range_name = "services-ip-range"
    ip_cidr_range = "10.0.10.0/24"
  }

}
