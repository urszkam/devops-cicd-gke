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

module "vpc" {
  source = "./modules/vpc"

  network_name     = var.vpc_name
  subnetwork_name  = var.vpc_subnetwork_name
  region           = var.region
  nodes_cidr_block = var.vpc_nodes_cidr_block
  pods_range_name  = var.vpc_pods_range_name
  pods_cidr_block  = var.vpc_pods_cidr_block

  depends_on = [module.project_services]
}

module "iam" {
  source = "./modules/iam"

  gke_service_account_id           = "${var.project_name}-gke"
  gke_service_account_display_name = "GKE node service account for ${var.gke_cluster_name}"
  gke_node_roles                   = var.gke_node_roles
  project_id                       = var.project_id

  depends_on = [module.project_services]
}

module "gke" {
  source = "./modules/gke"

  cluster_name               = var.gke_cluster_name
  location                   = var.region
  node_service_account       = module.iam.gke_service_account_email
  deletion_protection        = var.gke_deletion_protection
  labels                     = local.common_labels
  master_ipv4_cidr_block     = var.gke_master_ipv4_cidr_block
  master_authorized_networks = var.gke_master_authorized_networks
  network                    = module.vpc.network_id
  subnetwork                 = module.vpc.subnetwork_id
  pods_range_name            = module.vpc.pods_range_name

  depends_on = [
    module.iam,
    module.project_services,
    module.vpc,
  ]
}

module "monitoring" {
  source = "./modules/monitoring"

  app_name                         = var.app_name
  namespace                        = var.kubernetes_namespace
  notification_email               = var.notification_email
  probe_duration_threshold_seconds = var.probe_duration_threshold_seconds
  labels                           = local.common_labels

  depends_on = [module.project_services]
}
