output "cloud_run_service_account_email" {
  description = "Cloud Run runtime service account email."
  value       = google_service_account.cloud_run.email
}

output "gke_service_account_email" {
  description = "GKE node service account email."
  value       = google_service_account.gke.email
}
