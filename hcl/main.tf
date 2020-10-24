terraform {
  required_version = ">= 0.13.0"
}

output "greeting" {
  value = "Hello Terraform."
}

provider "random"{}