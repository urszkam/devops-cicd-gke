# Remote state stored in GCS bucket
terraform {
  backend "gcs" {
    bucket = "suml-s28722-terraform-state"
    prefix = "dev"
  }
}
