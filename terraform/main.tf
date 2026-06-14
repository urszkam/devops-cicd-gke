module "artifact_registry" {
  source = "./modules/artifact_registry"

  repository_id = var.cloud_run_service_name
  location      = var.region
  description   = "Docker images for ${var.cloud_run_service_name}."
  labels = {
    app     = var.cloud_run_service_name
    env     = var.env
    project = var.project_name
  }
}

module "iam" {
  source = "./modules/iam"

  cloud_run_service_account_id           = "${var.project_name}-run"
  cloud_run_service_account_display_name = "Cloud Run service account for ${var.cloud_run_service_name}"
}

module "cloud_run" {
  source = "./modules/cloud_run"

  service_name          = var.cloud_run_service_name
  location              = var.region
  service_account_email = module.iam.cloud_run_service_account_email
  container_image       = "${var.region}-docker.pkg.dev/${var.project_id}/${var.cloud_run_service_name}/${var.cloud_run_service_name}:${var.container_image_tag}"
  container_port        = var.container_port
  allow_unauthenticated = var.allow_unauthenticated
  min_instances         = var.cloud_run_min_instances
  max_instances         = var.cloud_run_max_instances
  memory                = var.cloud_run_memory
  labels = {
    app     = var.cloud_run_service_name
    env     = var.env
    project = var.project_name
  }

  depends_on = [
    module.artifact_registry,
    module.iam,
  ]
}
