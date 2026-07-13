resource "google_service_account" "gke" {
  account_id   = var.gke_service_account_id
  display_name = var.gke_service_account_display_name
}

resource "google_project_iam_member" "gke_node" {
  for_each = var.gke_node_roles

  project = var.project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.gke.email}"
}
