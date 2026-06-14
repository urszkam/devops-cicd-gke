variable "service_name" {
  description = "Service name."
  type        = string
}

variable "location" {
  description = "Service location."
  type        = string
}

variable "container_image" {
  description = "Container image."
  type        = string
}

variable "service_account_email" {
  description = "Service account email."
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

variable "min_instances" {
  description = "Minimum instances."
  type        = number
}

variable "max_instances" {
  description = "Maximum instances."
  type        = number
}

variable "memory" {
  description = "Memory limit."
  type        = string
}

variable "labels" {
  description = "Resource labels."
  type        = map(string)
}
