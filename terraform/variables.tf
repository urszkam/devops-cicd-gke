variable "project_id" {
  description = "GCP project ID."
  type        = string
}

variable "project_name" {
  description = "Project name prefix."
  type        = string
}

variable "env" {
  description = "Environment name."
  type        = string
}

variable "region" {
  description = "GCP region."
  type        = string
}

variable "enabled_services" {
  description = "Google Cloud APIs enabled for the project."
  type        = set(string)
}

variable "app_name" {
  description = "Application name."
  type        = string
}

variable "kubernetes_namespace" {
  description = "Kubernetes namespace containing the application."
  type        = string
}

variable "notification_email" {
  description = "Email address receiving monitoring notifications."
  type        = string

  validation {
    condition     = can(regex("^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$", var.notification_email))
    error_message = "notification_email must be a valid email address."
  }
}

variable "probe_duration_threshold_seconds" {
  description = "Maximum allowed average probe duration in seconds."
  type        = number
}

variable "vpc_name" {
  description = "Name of the VPC network."
  type        = string
}

variable "vpc_subnetwork_name" {
  description = "Name of the GKE subnetwork."
  type        = string
}

variable "vpc_nodes_cidr_block" {
  description = "Primary subnet CIDR used by GKE nodes."
  type        = string
}

variable "vpc_pods_range_name" {
  description = "Name of the secondary subnet range used by GKE Pods."
  type        = string
}

variable "vpc_pods_cidr_block" {
  description = "Secondary subnet CIDR used by GKE Pods."
  type        = string
}

variable "gke_cluster_name" {
  description = "GKE cluster name."
  type        = string
}

variable "gke_node_roles" {
  description = "IAM roles assigned to the GKE node service account."
  type        = set(string)
}

variable "gke_deletion_protection" {
  description = "Enable deletion protection for the GKE cluster."
  type        = bool
  default     = true
}

variable "gke_master_ipv4_cidr_block" {
  description = "RFC 1918 /28 range used by the GKE control plane."
  type        = string
}

variable "gke_master_authorized_networks" {
  description = "CIDR ranges allowed to reach the public GKE control-plane endpoint."
  type = list(object({
    cidr_block   = string
    display_name = string
  }))
}
