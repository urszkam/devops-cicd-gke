resource "google_compute_network" "this" {
  name                    = var.network_name
  auto_create_subnetworks = false
  description             = "VPC network for ${var.network_name}."
}

resource "google_compute_subnetwork" "this" {
  name          = var.subnetwork_name
  ip_cidr_range = var.nodes_cidr_block
  region        = var.region
  network       = google_compute_network.this.id
  description   = "Subnet used by the GKE cluster."

  private_ip_google_access = true

  secondary_ip_range {
    range_name    = var.pods_range_name
    ip_cidr_range = var.pods_cidr_block
  }

  log_config {
    aggregation_interval = "INTERVAL_1_MIN"
    flow_sampling        = 0.3
    metadata             = "INCLUDE_ALL_METADATA"
  }
}

resource "google_compute_router" "this" {
  name        = "${var.network_name}-router"
  region      = var.region
  network     = google_compute_network.this.id
  description = "Cloud Router used by Cloud NAT."
}

resource "google_compute_router_nat" "this" {
  name                               = "${var.network_name}-nat"
  router                             = google_compute_router.this.name
  region                             = var.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}
