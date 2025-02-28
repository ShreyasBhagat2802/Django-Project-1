terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.88.0"
    }
  }
  cloud {

    organization = "ShreyasBhagat28"

    workspaces {
      name = "Terrafrom-${var.environment}"
    }
  }
}
