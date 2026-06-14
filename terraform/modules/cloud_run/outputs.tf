output "service_uri" {
  description = "Cloud Run URL."
  value       = google_cloud_run_v2_service.service.uri
}
