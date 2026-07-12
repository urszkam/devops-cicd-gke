output "gke_service_account_email" {
  description = "GKE node service account email."
  value       = google_service_account.gke.email
}
