#Terraform
# Terraform current cli version is `v0.13.5`

terraform {
  required_version = ">= 0.13.0"
}

#Provider
# Implement cloud specific API and Terraform API.
# Provider configuation is specific to each provider.
# Providers expose Data Sources and Resources to Terraform.
provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
  #access_key = "my-access-key"
  #secret_key = "my-secret-key"

  #Many providers also accept configuration via environment variables
  #or config files.  The AWS provider will read the standard AWS CLI
  #settings if they are present.
}

#Resources
# Objects managed by Terraform such as VMs or S3 Buckets.
# Declaring a Resource tells Terraform that it should CREATE
# and manage the Resource described.  If the Resource already exists
# it must be imported into Terraform's state.
resource "aws_s3_bucket" "bucket1" {
    bucket = "backet1r"
}


#Data Sources
# Objects NOT managed by Terraform.{terraform is not responsible for the existences of these objects}

data "aws_caller_identity" "current" {}

data "aws_availability_zones" "available" {
  state = "available"
}

output "greeting" {
  value = "Hello Terraform."
}

# this was a random provider.
# provider "random" {}
