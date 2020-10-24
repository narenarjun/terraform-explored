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



output "greeting" {
  value = "Hello Terraform."
}

# this was a random provider.
# provider "random" {}
