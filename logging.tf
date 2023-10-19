resource "google_storage_bucket" "airflow_logs" {
  count                    = var.airflow_logs_bucket_name != null ? 1 : 0
  project                  = var.project_id
  name                     = var.airflow_logs_bucket_name
  location                 = var.airflow_logs_bucket_location
  public_access_prevention = "enforced"
}

resource "google_service_account" "airflow_logger" {
  count        = (var.airflow_logs_bucket_name != null && var.airflow_logs_sa != null) ? 1 : 0
  project      = var.project_id
  account_id   = var.airflow_logs_sa
  display_name = var.airflow_logs_sa
  description  = "Service account to write Airflow logs to Cloud Storage"
}

resource "google_storage_bucket_iam_member" "airflow_logger_admin" {
  count  = (var.airflow_logs_bucket_name != null && var.airflow_logs_sa != null) ? 1 : 0
  bucket = google_storage_bucket.airflow_logs[0].name
  role   = "roles/storage.admin"
  member = google_service_account.airflow_logger[0].member
}
