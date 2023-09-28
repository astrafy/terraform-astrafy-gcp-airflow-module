terraform {
  required_version = ">=0.13"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.74.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 4.58.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.18.1"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">= 4.0.4"
    }
    github = {
      source  = "integrations/github"
      version = ">= 5.36.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.4.3"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.11.0"
    }
  }
}
