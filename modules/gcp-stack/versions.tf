terraform {
  required_providers {
    spacelift = {
      source = "spacelift.io/spacelift-io/spacelift"
    }
    google = {
      source = "hashicorp/google"
    }
  }
  required_version = ">=0.12.26, <0.14"
}

