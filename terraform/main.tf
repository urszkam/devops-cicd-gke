module "project_services" {
  source = "./modules/project_services"

  project_id = var.project_id
  services   = var.enabled_services
}

module "artifact_registry" {
  source = "./modules/artifact_registry"

  repository_id = var.app_name
  location      = var.region
  description   = "Docker images for ${var.app_name}."
  labels        = local.common_labels

  depends_on = [module.project_services]
}

module "iam" {
  source = "./modules/iam"

  gke_service_account_id           = "${var.project_name}-gke"
  gke_service_account_display_name = "GKE node service account for ${var.gke_cluster_name}"
  project_id                       = var.project_id

  depends_on = [module.project_services]
}

module "gke" {
  source = "./modules/gke"

  cluster_name         = var.gke_cluster_name
  location             = var.region
  node_service_account = module.iam.gke_service_account_email
  deletion_protection  = var.gke_deletion_protection
  labels               = local.common_labels

  depends_on = [
    module.iam,
    module.project_services,
  ]
}
