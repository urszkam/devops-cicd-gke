resource "google_service_account" "cloud_run" {
  account_id   = var.cloud_run_service_account_id
  display_name = var.cloud_run_service_account_display_name
}
