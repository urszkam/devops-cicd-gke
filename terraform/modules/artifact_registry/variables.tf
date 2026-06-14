variable "repository_id" {
  description = "Repository ID."
  type        = string
}

variable "location" {
  description = "Repository location."
  type        = string
}

variable "description" {
  description = "Repository description."
  type        = string
}

variable "labels" {
  description = "Resource labels."
  type        = map(string)
}
