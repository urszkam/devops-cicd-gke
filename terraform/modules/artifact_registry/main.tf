resource "google_artifact_registry_repository" "this" {
  #checkov:skip=CKV_GCP_84:Google-managed encryption is acceptable
  location      = var.location
  repository_id = var.repository_id
  description   = var.description
  format        = "DOCKER"

  labels = var.labels
}
