resource "google_monitoring_notification_channel" "email" {
  display_name = "Monitoring email"
  type         = "email"

  labels = {
    email_address = var.notification_email
  }

  user_labels = var.labels
}

resource "google_monitoring_alert_policy" "probe_failure" {
  display_name = "${var.app_name} probe failure"
  combiner     = "OR"
  enabled      = true
  user_labels  = var.labels

  notification_channels = [google_monitoring_notification_channel.email.name]

  conditions {
    display_name = "Application probe is failing"

    condition_prometheus_query_language {
      query               = "probe_success{namespace=\"${var.namespace}\", pod=~\"blackbox-exporter-.*\"} == 0"
      duration            = "60s"
      evaluation_interval = "30s"
    }
  }
}

resource "google_monitoring_alert_policy" "probe_duration" {
  display_name = "${var.app_name} slow probe"
  combiner     = "OR"
  enabled      = true
  user_labels  = var.labels

  notification_channels = [google_monitoring_notification_channel.email.name]

  conditions {
    display_name = "Average probe duration exceeds ${var.probe_duration_threshold_seconds} seconds"

    condition_prometheus_query_language {
      query               = "avg_over_time(probe_duration_seconds{namespace=\"${var.namespace}\", pod=~\"blackbox-exporter-.*\"}[5m]) > ${var.probe_duration_threshold_seconds}"
      duration            = "0s"
      evaluation_interval = "30s"
    }
  }
}
