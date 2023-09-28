# terraform-astrafy-gcp-airflow-module
Terraform module to deploy Airflow in Google Cloud Platform

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.13 |
| <a name="requirement_github"></a> [github](#requirement\_github) | >= 5.36.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.74.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | >= 4.58.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.11.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.18.1 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.4.3 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 4.0.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | 5.38.0 |
| <a name="provider_google"></a> [google](#provider\_google) | 4.83.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.11.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.23.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.5.1 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_repository_deploy_key.airflow_deploy_key](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_deploy_key) | resource |
| [google_sql_database.airflow](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database) | resource |
| [google_sql_database_instance.airflow_db](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance) | resource |
| [google_sql_user.db_user](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_user) | resource |
| [helm_release.airflow](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_secret_v1.airflow_db_credentials](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret_v1) | resource |
| [kubernetes_secret_v1.fernet_key_secret](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret_v1) | resource |
| [kubernetes_secret_v1.gitsync_creds](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret_v1) | resource |
| [kubernetes_secret_v1.webserver_secret_key](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret_v1) | resource |
| [random_password.db_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [random_password.fernet_key](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [random_password.webserver_secret_key](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [tls_private_key.github_deploy_key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_airflow_values_filepath"></a> [airflow\_values\_filepath](#input\_airflow\_values\_filepath) | Airflow helm chart values file path | `string` | `null` | no |
| <a name="input_airflow_version"></a> [airflow\_version](#input\_airflow\_version) | Airflow helm chart version | `string` | `"1.10.0"` | no |
| <a name="input_allocated_ip_range"></a> [allocated\_ip\_range](#input\_allocated\_ip\_range) | Allocated IP range for the SQL instance | `string` | `null` | no |
| <a name="input_dags_repository"></a> [dags\_repository](#input\_dags\_repository) | Name of the GitHub repository where the DAGs are stored | `string` | n/a | yes |
| <a name="input_deploy_airflow"></a> [deploy\_airflow](#input\_deploy\_airflow) | Create Airflow with the helm chart | `bool` | `false` | no |
| <a name="input_deploy_cloud_sql"></a> [deploy\_cloud\_sql](#input\_deploy\_cloud\_sql) | Deploy Cloud SQL | `bool` | `true` | no |
| <a name="input_deploy_github_keys"></a> [deploy\_github\_keys](#input\_deploy\_github\_keys) | Create a GitHub Key and a secret in k8s to access the private dags | `bool` | `true` | no |
| <a name="input_k8s_airflow_fernet_key_secret_name"></a> [k8s\_airflow\_fernet\_key\_secret\_name](#input\_k8s\_airflow\_fernet\_key\_secret\_name) | Name of the Kubernetes secret where fernet key will be stored | `string` | `"fernet-key"` | no |
| <a name="input_k8s_airflow_namespace"></a> [k8s\_airflow\_namespace](#input\_k8s\_airflow\_namespace) | Name of the Kubernetes namespace where the Airflow resources will be deployed | `string` | n/a | yes |
| <a name="input_k8s_db_credentials_secret_name"></a> [k8s\_db\_credentials\_secret\_name](#input\_k8s\_db\_credentials\_secret\_name) | Name of the Kubernetes secret where the database credentials will be stored | `string` | `"airflow-db-credentials"` | no |
| <a name="input_k8s_git_sync_secret_name"></a> [k8s\_git\_sync\_secret\_name](#input\_k8s\_git\_sync\_secret\_name) | Name of the secret where the token to syncronize the dags in GitHub is stored | `string` | `"gitsync-creds"` | no |
| <a name="input_k8s_webserver_secret_key_secret_name"></a> [k8s\_webserver\_secret\_key\_secret\_name](#input\_k8s\_webserver\_secret\_key\_secret\_name) | Name of the Kubernetes secret where webserver secret key will be stored | `string` | `"webserver-secret-key"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | ID of the project where to create the Airflow Resources | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region of the project where to create the Airflow Resources | `string` | n/a | yes |
| <a name="input_require_ssl"></a> [require\_ssl](#input\_require\_ssl) | Require SSL for the SQL instance | `bool` | `false` | no |
| <a name="input_sql_database_name"></a> [sql\_database\_name](#input\_sql\_database\_name) | SQL instance name | `string` | `"airflow"` | no |
| <a name="input_sql_delete_protection"></a> [sql\_delete\_protection](#input\_sql\_delete\_protection) | Delete protection for the SQL instance | `bool` | `true` | no |
| <a name="input_sql_edition"></a> [sql\_edition](#input\_sql\_edition) | SQL edition. Can be ENTERPRISE or ENTERPRISE\_PLUS | `string` | `"ENTERPRISE"` | no |
| <a name="input_sql_instance_name"></a> [sql\_instance\_name](#input\_sql\_instance\_name) | SQL instance name | `string` | `"airflow-db"` | no |
| <a name="input_sql_private_network"></a> [sql\_private\_network](#input\_sql\_private\_network) | Network where to create the SQL instance. Format projects/{project\_id}/global/networks/{network\_id}. | `string` | `null` | no |
| <a name="input_sql_tier"></a> [sql\_tier](#input\_sql\_tier) | Tier of the sql database | `string` | `"db-custom-1-3840"` | no |
| <a name="input_sql_user"></a> [sql\_user](#input\_sql\_user) | SQL instance name | `string` | `"airflow-root"` | no |
| <a name="input_sql_version"></a> [sql\_version](#input\_sql\_version) | SQL instance name | `string` | `"POSTGRES_15"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_airflow_db_credentials_secret"></a> [airflow\_db\_credentials\_secret](#output\_airflow\_db\_credentials\_secret) | n/a |
| <a name="output_airflow_fernet_key_secret"></a> [airflow\_fernet\_key\_secret](#output\_airflow\_fernet\_key\_secret) | n/a |
| <a name="output_airflow_git_sync_secret"></a> [airflow\_git\_sync\_secret](#output\_airflow\_git\_sync\_secret) | n/a |
| <a name="output_airflow_webserver_secret_key_secret"></a> [airflow\_webserver\_secret\_key\_secret](#output\_airflow\_webserver\_secret\_key\_secret) | n/a |
<!-- END_TF_DOCS -->
