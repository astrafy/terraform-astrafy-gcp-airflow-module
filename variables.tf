/******************************************
  Google Cloud
*****************************************/

variable "project_id" {
  type        = string
  description = "ID of the project where to create the Airflow Resources"
}

variable "region" {
  type        = string
  description = "Region of the project where to create the Airflow Resources"
}

/******************************************
  Cloud SQL
*****************************************/

variable "deploy_cloud_sql" {
  type        = bool
  description = "Deploy Cloud SQL"
  default     = true
}

variable "sql_instance_name" {
  type        = string
  description = "SQL instance name"
  default     = "airflow-db"
}

variable "sql_database_name" {
  type        = string
  description = "SQL instance name"
  default     = "airflow"
}

variable "sql_user" {
  type        = string
  description = "SQL instance name"
  default     = "airflow-root"
}

variable "sql_edition" {
  type        = string
  description = "SQL edition. Can be ENTERPRISE or ENTERPRISE_PLUS"
  default     = "ENTERPRISE"
}

variable "sql_version" {
  type        = string
  description = "SQL instance name"
  default     = "POSTGRES_15"
}

variable "sql_tier" {
  type        = string
  description = "Tier of the sql database"
  default     = "db-custom-1-3840"
}

variable "sql_private_network" {
  type        = string
  description = "Network where to create the SQL instance. Format projects/{project_id}/global/networks/{network_id}."
  default     = null
}

variable "allocated_ip_range" {
  type        = string
  description = "Allocated IP range for the SQL instance"
  default     = null
}

variable "require_ssl" {
  type        = bool
  description = "Require SSL for the SQL instance"
  default     = false
}

variable "sql_delete_protection" {
  type        = bool
  description = "Delete protection for the SQL instance"
  default     = true
}

/******************************************
  GitHub
*****************************************/

variable "deploy_github_keys" {
  type        = bool
  description = "Create a GitHub Key and a secret in k8s to access the private dags"
  default     = true
}

variable "dags_repository" {
  type        = string
  description = "Name of the GitHub repository where the DAGs are stored"
}

/******************************************
  GKE
*****************************************/

variable "k8s_airflow_namespace" {
  type        = string
  description = "Name of the Kubernetes namespace where the Airflow resources will be deployed"
}

variable "k8s_db_credentials_secret_name" {
  type        = string
  description = "Name of the Kubernetes secret where the database credentials will be stored"
  default     = "airflow-db-credentials"
}

variable "k8s_webserver_secret_key_secret_name" {
  type        = string
  description = "Name of the Kubernetes secret where webserver secret key will be stored"
  default     = "webserver-secret-key"
}

variable "k8s_airflow_fernet_key_secret_name" {
  type        = string
  description = "Name of the Kubernetes secret where fernet key will be stored"
  default     = "fernet-key"
}

variable "k8s_git_sync_secret_name" {
  type        = string
  description = "Name of the secret where the token to syncronize the dags in GitHub is stored"
  default     = "gitsync-creds"
}

/******************************************
  Airflow Deployment
*****************************************/

variable "deploy_airflow" {
  type        = bool
  description = "Deploy Airflow with the helm chart"
  default     = false
}

variable "airflow_version" {
  type        = string
  description = "Airflow helm chart version"
  default     = "1.10.0"
}

variable "airflow_values_filepath" {
  type        = string
  description = "Airflow helm chart values file path"
  default     = null
}

/******************************************
  Airflow logging
*****************************************/

# If airflow_logs_bucket_name is set to null, no airflow logging resources will be created
variable "airflow_logs_bucket_name" {
  type        = string
  description = "Name of the bucket in which to store the Airflow logs"
  default     = null
}

variable "airflow_logs_bucket_location" {
  type        = string
  description = "Location of the bucket in which to store the Airflow logs"
  default     = "EU"
}

variable "airflow_logs_sa" {
  type        = string
  description = "Service account with admin access to the bucket where Airflow writes the logs"
  default     = null
}
