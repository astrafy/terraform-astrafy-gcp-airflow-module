resource "google_sql_database_instance" "airflow_db" {
  count            = var.deploy_cloud_sql ? 1 : 0
  name             = var.sql_instance_name
  database_version = var.sql_version

  project = var.project_id
  region  = var.region

  deletion_protection = var.sql_delete_protection


  settings {
    tier    = var.sql_tier
    edition = var.sql_edition

    ip_configuration {
      ipv4_enabled                                  = var.sql_private_network == null ? true : false
      private_network                               = var.sql_private_network
      enable_private_path_for_google_cloud_services = var.sql_private_network == null ? false : true
      allocated_ip_range                            = var.allocated_ip_range
      require_ssl                                   = var.require_ssl
    }

    backup_configuration {
      enabled                        = true
      point_in_time_recovery_enabled = true
    }
  }
}

resource "google_sql_database" "airflow" {
  count    = var.deploy_cloud_sql ? 1 : 0
  instance = google_sql_database_instance.airflow_db[0].name
  name     = var.sql_database_name
  project  = var.project_id
}

resource "google_sql_user" "db_user" {
  count    = var.deploy_cloud_sql ? 1 : 0
  name     = var.sql_user
  instance = google_sql_database_instance.airflow_db[0].name
  password = random_password.db_password[0].result
  project  = var.project_id
}

resource "random_password" "db_password" {
  count   = var.deploy_cloud_sql ? 1 : 0
  length  = 12
  special = false
}


resource "random_password" "fernet_key" {
  count            = var.deploy_cloud_sql ? 1 : 0
  length           = 32
  special          = false
  override_special = "_-"
}
