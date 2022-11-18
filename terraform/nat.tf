resource "google_compute_router" "myrouter" {
  name    = "myrouter"
  project = "alaa-368700"
  region  = google_compute_subnetwork.public-subnet.region
  network = google_compute_network.vpc.id
}


resource "google_compute_router_nat" "nat" {
  name                               = "nat"
  router                             = google_compute_router.myrouter.name
  region                             = google_compute_router.myrouter.region
  nat_ip_allocate_option             = "AUTO_ONLY"
 source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
 #source_subnetwork_ip_ranges_to_nat = "ALL_IP_RANGES"



 #source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  #subnetwork {
   # name                    = google_compute_subnetwork.public-subnet.id
    #source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  #}
  #subnetwork { 
   #  name = google_compute_subnetwork.private-subnet.id
    # source_ip_ranges_to_nat = [ "ALL_IP_RANGES"] 
  #}
}



resource "google_compute_firewall" "firewall" {
  name    = "firewall"
  direction     = "INGRESS"
  source_ranges =  [ "35.235.240.0/20" ]
  network = google_compute_network.vpc.name
  
  
  allow {
    protocol = "tcp"
    ports    = ["22","80"]
  }

 
}
