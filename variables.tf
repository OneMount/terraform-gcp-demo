variable "project_id" {
  default = "vinid-playground"
}

data "google_compute_default_service_account" "default" {}



variable "region" {
  default = "asia-east2"
}
