locals {
  common_labels = {
    app     = var.app_name
    env     = var.env
    project = var.project_name
  }
}
