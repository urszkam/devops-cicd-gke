variable "gke_service_account_id" {
  description = "GKE node service account ID."
  type        = string
}

variable "gke_service_account_display_name" {
  description = "GKE node service account name."
  type        = string
}

variable "gke_node_roles" {
  description = "IAM roles assigned to the GKE node service account."
  type        = list(string)
}

variable "project_id" {
  description = "GCP project ID."
  type        = string
}
