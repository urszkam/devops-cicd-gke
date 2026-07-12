output "network_id" {
  description = "ID of the VPC network."
  value       = google_compute_network.this.id
}

output "subnetwork_id" {
  description = "ID of the GKE subnetwork."
  value       = google_compute_subnetwork.this.id
}

output "pods_range_name" {
  description = "Name of the secondary range used by GKE Pods."
  value       = var.pods_range_name
}
