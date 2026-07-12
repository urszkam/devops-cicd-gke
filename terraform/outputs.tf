output "gke_cluster_name" {
  description = "GKE cluster name."
  value       = module.gke.cluster_name
}

output "gke_cluster_location" {
  description = "GKE cluster location."
  value       = module.gke.cluster_location
}

output "vpc_network_id" {
  description = "ID of the VPC network."
  value       = module.vpc.network_id
}

output "vpc_subnetwork_id" {
  description = "ID of the GKE subnetwork."
  value       = module.vpc.subnetwork_id
}
