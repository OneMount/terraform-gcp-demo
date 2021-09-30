provider "google" {
  project = var.project_id
  alias   = "tokengen"
  scopes = [
    "https://www.googleapis.com/auth/cloud-platform",
    "https://www.googleapis.com/auth/userinfo.email",
    "https://www.googleapis.com/auth/devstorage.full_control"
  ]
  region = var.region
}

data "google_service_account_access_token" "sa" {
  provider               = google.tokengen
  target_service_account = "resources-creator@vinid-playground.iam.gserviceaccount.com"
  #service account được tạo ở bước trên
  lifetime               = "3500s"
  scopes = [
    "https://www.googleapis.com/auth/cloud-platform",
    "https://www.googleapis.com/auth/devstorage.full_control"
  ]
}

provider "google" {
  access_token = data.google_service_account_access_token.sa.access_token 
  # Lấy token của service account, và sử dụng để tạo resource
  project      = var.project_id
  region       = var.region
}
#
provider "google-beta" {
  access_token = data.google_service_account_access_token.sa.access_token
  # Lấy token của service account, và sử dụng để tạo resource
  project      = var.project_id
  region       = var.region
}

