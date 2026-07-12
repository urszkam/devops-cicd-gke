variable "cloud_run_service_account_id" {
  description = "Service account ID."
  type        = string
}

variable "cloud_run_service_account_display_name" {
  description = "Service account name."
  type        = string
}

variable "gke_service_account_id" {
  description = "GKE node service account ID."
  type        = string
}

variable "gke_service_account_display_name" {
  description = "GKE node service account name."
  type        = string
}

variable "project_id" {
  description = "GCP project ID."
  type        = string
}
