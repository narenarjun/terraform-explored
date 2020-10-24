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

> ## 📚 Note
>
> After any change done to any `.tf` file, should run plan command `terraform plan`,
> after that only we have to apply them with
> `terraform apply`



### Terraform Graph

with `terraform graph` command, we get the data of your state 
to be utilized to view it in graphical way. 

we can save the output of the graph command to a `.dot` file and view that file via `graphviz` tool.

```bash
>>$ terraform graph > visulgrphst.dot
```

 Vscode has a 
`graphviz plugin` which can be very useful


### AWS credentials

Since aws credentials are sensitive info, they are not added in the `main.tf` file,
they are set and exported in the environment variable in bash.

```bash
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
```
