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
  type        = list(string)
}

variable "app_name" {
  description = "Application name."
  type        = string
}

variable "gke_cluster_name" {
  description = "GKE cluster name."
  type        = string
}

variable "gke_deletion_protection" {
  description = "Enable deletion protection for the GKE cluster."
  type        = bool
  default     = true
}
