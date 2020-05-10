provider "aws" {
  region     = "us-east-1"
}

terraform {
  backend "s3" {
    key            = "develop/terraform.tfstate"
    bucket         = "terraform-cloudilm-staging-bucket"
    region         = "us-east-1"
    dynamodb_table = "terraform-cloudilm-staging-dynamodb"
    encrypt        = true
  }
}