terraform {
    backend "gcs" {
    bucket      = "om-gcp-tf-state" # Bucket được tạo ở bước trên
    impersonate_service_account = "resources-creator@yourproject.iam.gserviceaccount.com" 
    #service account được tạo ở bước trên 
    # service account này sẽ đọc bucket và ghi state lên bucket
  }
  required_providers {
    google = {
      source = "hashicorp/google"
    }
    google-beta = {
      source = "hashicorp/google-beta"
    }
  }
  required_version = ">= 1.0.7"
}
