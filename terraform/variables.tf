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

variable "cloud_run_service_name" {
  description = "Application and Cloud Run service name."
  type        = string
}

variable "container_image_tag" {
  description = "Image tag."
  type        = string
}

variable "container_port" {
  description = "Container port."
  type        = number
}

variable "allow_unauthenticated" {
  description = "Allow public access."
  type        = bool
}

variable "cloud_run_min_instances" {
  description = "Minimum instances."
  type        = number
}

variable "cloud_run_max_instances" {
  description = "Maximum instances."
  type        = number
}

variable "cloud_run_memory" {
  description = "Memory limit."
  type        = string
}
