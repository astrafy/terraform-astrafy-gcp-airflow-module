resource "random_password" "webserver_secret_key" {
  count   = var.deploy_cloud_sql ? 1 : 0
  length  = 12
  special = false
}

resource "kubernetes_secret_v1" "webserver_secret_key" {
  count = var.deploy_cloud_sql ? 1 : 0
  metadata {
    name      = var.k8s_webserver_secret_key_secret_name
    namespace = var.k8s_airflow_namespace
  }

  data = {
    (var.k8s_webserver_secret_key_secret_name) = random_password.webserver_secret_key[0].result
  }
}

resource "kubernetes_secret_v1" "airflow_db_credentials" {
  count = var.deploy_cloud_sql ? 1 : 0
  metadata {
    name      = var.k8s_db_credentials_secret_name
    namespace = var.k8s_airflow_namespace
  }

  data = {
    connection = "postgresql://${google_sql_user.db_user[0].name}:${random_password.db_password[0].result}@${google_sql_database_instance.airflow_db[0].first_ip_address}:5432/${var.sql_database_name}"
  }
}

resource "kubernetes_secret_v1" "fernet_key_secret" {
  count = var.deploy_cloud_sql ? 1 : 0
  metadata {
    name      = var.k8s_airflow_fernet_key_secret_name
    namespace = var.k8s_airflow_namespace
  }

  data = {
    fernet-key = base64encode(random_password.fernet_key[0].result)
  }
}

resource "kubernetes_secret_v1" "gitsync_creds" {
  count = var.deploy_github_keys ? 1 : 0
  metadata {
    name      = var.k8s_git_sync_secret_name
    namespace = var.k8s_airflow_namespace
  }
  data = {
    gitSshKey = tls_private_key.github_deploy_key[0].private_key_openssh
  }
}
