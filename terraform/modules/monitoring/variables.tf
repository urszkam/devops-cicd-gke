variable "app_name" {
  description = "Application name used in alert policy names."
  type        = string
}

variable "namespace" {
  description = "Kubernetes namespace containing the monitored application."
  type        = string
}

variable "notification_email" {
  description = "Email address receiving monitoring notifications."
  type        = string
}

variable "probe_duration_threshold_seconds" {
  description = "Maximum allowed average probe duration in seconds."
  type        = number
}

variable "labels" {
  description = "Labels assigned to monitoring resources."
  type        = map(string)
}
