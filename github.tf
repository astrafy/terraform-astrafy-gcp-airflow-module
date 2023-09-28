resource "tls_private_key" "github_deploy_key" {
  count     = var.deploy_github_keys ? 1 : 0
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "github_repository_deploy_key" "airflow_deploy_key" {
  count      = var.deploy_github_keys ? 1 : 0
  title      = "Repository test key"
  repository = var.dags_repository
  key        = sensitive(tls_private_key.github_deploy_key[0].public_key_openssh)
  read_only  = "true"
}
