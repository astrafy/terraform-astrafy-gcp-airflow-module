resource "helm_release" "airflow" {
  count = var.deploy_airflow ? 1 : 0

  name       = "airflow"
  chart      = "airflow"
  repository = "https://airflow.apache.org"
  version    = var.airflow_version
  namespace  = var.k8s_airflow_namespace

  wait = false

  values = [
    templatefile(var.airflow_values_filepath, {}),
  ]

  depends_on = [kubernetes_secret_v1.airflow_db_credentials]
}
