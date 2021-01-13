provider "spacelift" {}

terraform {
  required_version = ">=0.12.6, <0.14"
  required_providers {
    spacelift = {
      source  = "spacelift.io/spacelift-io/spacelift"
      version = "1.0.0"
    }
    google = {
      source  = "hashicorp/google-beta"
      version = "~> 3.51.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 3.51.0"
    }
  }
}
