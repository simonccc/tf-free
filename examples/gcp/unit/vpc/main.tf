provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_project_region
}
provider "google-beta" {
  project = var.gcp_project_id
  region  = var.gcp_project_region
}

module "gcp_vpc" {
  vpc_name       = var.gcp_network_name
  static_ip_name = var.gcp_ipv4_name
  source         = "../../../../modules/gcp/vpc"
  google_project = var.gcp_project_id
}

module "gcp_firewall" {
  depends_on = [
    module.gcp_vpc.network_name
  ]
  source       = "../../../../modules/gcp/firewall"
  network_name = module.gcp_vpc.network_name
}