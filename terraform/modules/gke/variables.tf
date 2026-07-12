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

variable "master_ipv4_cidr_block" {
  description = "RFC 1918 /28 range used by the GKE control plane."
  type        = string
}

variable "master_authorized_networks" {
  description = "CIDR ranges allowed to reach the public GKE control-plane endpoint."
  type = list(object({
    cidr_block   = string
    display_name = string
  }))
}

variable "network" {
  description = "ID of the VPC network used by the cluster."
  type        = string
}

variable "subnetwork" {
  description = "ID of the subnetwork used by the cluster."
  type        = string
}

variable "pods_range_name" {
  description = "Name of the subnetwork secondary range used by GKE Pods."
  type        = string
}
