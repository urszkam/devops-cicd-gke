locals {
  common_labels = {
    app     = var.cloud_run_service_name
    env     = var.env
    project = var.project_name
  }
}
