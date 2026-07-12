output "cloud_run_service_uri" {
  description = "Cloud Run URL."
  value       = module.cloud_run.service_uri
}

output "gke_cluster_name" {
  description = "GKE cluster name."
  value       = module.gke.cluster_name
}

output "gke_cluster_location" {
  description = "GKE cluster location."
  value       = module.gke.cluster_location
}
