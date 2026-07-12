resource "google_container_cluster" "this" {
  name     = var.cluster_name
  location = var.location

  enable_autopilot    = true
  deletion_protection = var.deletion_protection
  resource_labels     = var.labels

  release_channel {
    channel = "STABLE"
  }

  node_config {
    service_account = var.node_service_account
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}
