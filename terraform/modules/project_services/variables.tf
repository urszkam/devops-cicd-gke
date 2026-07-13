variable "project_id" {
  description = "GCP project ID."
  type        = string
}

variable "services" {
  description = "Google Cloud APIs enabled for the project."
  type        = set(string)
}
