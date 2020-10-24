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


#Interpolation
# Substitute values in strings.
resource "aws_s3_bucket" "bucket2" {
  bucket = "${data.aws_caller_identity.current.account_id}-backet2r"
}


#Dependency
# Resources can depend on one another.  Terraform will ensure that all
# dependencies are met before creating the resource.  Dependency can
# be implicit or explicit.

# ! the following bucket 3 and bucket 4 is commented to reserve rescources.
# resource "aws_s3_bucket" "bucket3" {
#     bucket = "${data.aws_caller_identity.current.account_id}-bucket3"
#     tags = {
#         # * Implicit dependency
#         dependency = aws_s3_bucket.bucket2.arn
#   }
# }

# resource "aws_s3_bucket" "bucket4" {
#     bucket = "${data.aws_caller_identity.current.account_id}-bucket4"
#     # * Explicit
#     depends_on = [
#         aws_s3_bucket.bucket3
#     ]
# }


#Variables
# Can be specified on the command line with -var bucket_name=my-bucket
# or in files: terraform.tfvars or *.auto.tfvars
# or in environment variables: TF_VAR_bucket_name
variable "bucket_name" {
  # `type` is an optional data type specification
  type = string

  # `default` is the optional default value.  If `default` is ommited
  # then a value must be supplied.
  #default = "my-bucket"
}

resource "aws_s3_bucket" "bucket5" {
  bucket = var.bucket_name
}


#Local Values
# Local values allow you to assign a name to an expression. Locals
# can make your code more readable.
# ? here lower is a function , which is seen next 
# * local names have to be unique in a file.
locals {
  aws_account = "${data.aws_caller_identity.current.account_id}-${lower(data.aws_caller_identity.current.user_id)}"
}


resource "aws_s3_bucket" "bucket6" {
  bucket = "${local.aws_account}-bucket6"
}



#Data Sources
# Objects NOT managed by Terraform.{terraform is not responsible for the existences of these objects}

data "aws_caller_identity" "current" {}

data "aws_availability_zones" "available" {
  state = "available"
}

#Outputs
# Outputs are printed by the CLI after `apply`.
# These can reveal calculated values.
# Also used in more advanced use cases: modules, remote_state
# Outputs can be retrieved at any time by running `terraform output`

# this the value got form the resource mentioned
output "bucket_info" {
  value = aws_s3_bucket.bucket1.bucket
}

# this will output the value of newly created aws bucket2
output "bucket2_info" {
  value = aws_s3_bucket.bucket2.bucket
}

# to  get values from the data sources, we need to prefix it with `data`, then `type`, then `label`
output "aws_caller_info" {
  value = data.aws_caller_identity.current
}

output "aws_availability_zones" {
  value = data.aws_availability_zones.available
}



# ! this is a simple output values.
# output "greeting" {
#   value = "Hello Terraform."
# }

# this was a random provider.
# provider "random" {}
