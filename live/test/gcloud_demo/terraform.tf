terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.18.0"
    }
  }

  required_version = "~> 1.10"

  backend "gcs" {
    bucket = "terraform-state-5251"
    prefix = "demo-gh-action"
  }
}

provider "google" {
  project = "deep-lore-449214-k8"
  region  = "us-central1"
  zone    = "us-central1-f"
}
