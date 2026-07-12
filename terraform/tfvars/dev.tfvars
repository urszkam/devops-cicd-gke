project_id   = "suml-dev-s28722-499308"
project_name = "suml-dev-s28722"
env          = "dev"
region       = "europe-west3"

enabled_services = [
  "artifactregistry.googleapis.com",
  "cloudbuild.googleapis.com",
  "compute.googleapis.com",
  "container.googleapis.com",
  "iam.googleapis.com",
  "iamcredentials.googleapis.com",
  "sts.googleapis.com",
]

app_name = "burnout-app"

vpc_name             = "suml-dev-vpc"
vpc_subnetwork_name  = "suml-dev-gke-subnet"
vpc_nodes_cidr_block = "10.10.0.0/20"
vpc_pods_range_name  = "gke-pods"
vpc_pods_cidr_block  = "10.20.0.0/16"

gke_cluster_name               = "suml-dev-gke"
gke_deletion_protection        = false
gke_master_ipv4_cidr_block     = "172.16.0.0/28"
gke_master_authorized_networks = []
gke_node_roles = [
  "roles/artifactregistry.reader",
  "roles/container.defaultNodeServiceAccount",
]
