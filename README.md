# Terraform explored

## Basics

Terraform uses declaritive approach.
Terraform uses `hcl` -> `hashicorp configuration language` or `json` to declare the configs needed.

Terraform comes with a cli which is a single executable can be downloaded from the hashicorp terraform website.

### First steps:

Run `terraform init` command to initialize in the folder where terraform files are stored for a project to let terraform get all the providers and other assets to setup.

In `main.tf` file, copy and paste the following:

```json
output "greeting" {
  value = "Hello Terraform."
}
```

now we have to mention a provider:

```json
provider "random"{}
```

run `init` command to get the providers,

```bash
>>$ terraform init
```

now, `plan` to check if the mentioned is correct,

```bash
terraform plan
```

will tell where the configs mentioned are correct and is there any updated to do.

now , let's see the output:

```bash
terraform output
```
