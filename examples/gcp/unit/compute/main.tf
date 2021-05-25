terraform {
  required_version = ">= 0.13"
  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "3.68.0"
    }
  }
}

provider "google-beta" {
  project     = var.google_project
  region      = var.project_region
  credentials = file("gcp.json")
}

module "gcp_instance" {
  source       = "github.com/gruberdev/tf-free/modules/gcp/compute"
  name         = var.instance_name
  region       = var.project_region
  network_name = var.network_name
}
