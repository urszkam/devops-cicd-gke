resource "google_container_cluster" "this" {
  # checkov:skip=CKV_GCP_12:Autopilot enables and manages network policy; the provider rejects network_policy with enable_autopilot.
  # checkov:skip=CKV_GCP_61:Autopilot manages intranode visibility; the provider rejects enable_intranode_visibility with enable_autopilot.
  # checkov:skip=CKV_GCP_65:Google Groups for RBAC requires a verified Google Workspace or Cloud Identity domain, which this project does not have.
  # checkov:skip=CKV_GCP_68:Autopilot manages node pools and rejects node_config updates, including Secure Boot settings.
  # checkov:skip=CKV_GCP_69:Autopilot enables the GKE Metadata Server and rejects workload_metadata_config updates through node_config.
  name       = var.cluster_name
  location   = var.location
  network    = var.network
  subnetwork = var.subnetwork

  enable_autopilot    = true
  deletion_protection = var.deletion_protection
  resource_labels     = var.labels

  binary_authorization {
    evaluation_mode = "PROJECT_SINGLETON_POLICY_ENFORCE"
  }

  ip_allocation_policy {
    cluster_secondary_range_name = var.pods_range_name
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = var.master_ipv4_cidr_block
  }

  master_authorized_networks_config {
    gcp_public_cidrs_access_enabled = true

    dynamic "cidr_blocks" {
      for_each = var.master_authorized_networks

      content {
        cidr_block   = cidr_blocks.value.cidr_block
        display_name = cidr_blocks.value.display_name
      }
    }
  }

  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }

  release_channel {
    channel = "STABLE"
  }

  cluster_autoscaling {
    auto_provisioning_defaults {
      service_account = var.node_service_account
    }
  }
}
