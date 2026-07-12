variable "cluster_name" {
  description = "GKE cluster name."
  type        = string
}

variable "location" {
  description = "GKE cluster location."
  type        = string
}

variable "node_service_account" {
  description = "Service account used by GKE nodes."
  type        = string
}

variable "deletion_protection" {
  description = "Enable deletion protection for the cluster."
  type        = bool
}

variable "labels" {
  description = "Labels assigned to the cluster."
  type        = map(string)
}
