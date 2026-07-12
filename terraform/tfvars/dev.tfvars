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
]

app_name = "burnout-app"

gke_cluster_name        = "suml-dev-gke"
gke_deletion_protection = false
