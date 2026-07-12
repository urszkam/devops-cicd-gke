variable "network_name" {
  description = "Name of the VPC network."
  type        = string
}

variable "subnetwork_name" {
  description = "Name of the GKE subnetwork."
  type        = string
}

variable "region" {
  description = "Region in which to create the subnetwork, router, and NAT."
  type        = string
}

variable "nodes_cidr_block" {
  description = "Primary subnet CIDR used by GKE nodes."
  type        = string
}

variable "pods_range_name" {
  description = "Name of the secondary subnet range used by GKE Pods."
  type        = string
}

variable "pods_cidr_block" {
  description = "Secondary subnet CIDR used by GKE Pods."
  type        = string
}
