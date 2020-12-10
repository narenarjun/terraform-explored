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

## Terraform Backend

Terraform state can be stored in a remote backend which stores 
the state , which can be locked to prevent unnesscary changes to the infrastructure state.
More details in [here.](https://www.terraform.io/docs/backends/index.html)

There are many [types of backends](https://www.terraform.io/docs/backends/types/#) and they are categorized into two: 
  * Standard: State management, functionality covered in State Storage & Locking

  * Enhanced: Everything in standard plus remote operations.

#### List of  Enhanced backends :

* local
* remote
#### List of standard backends:

 * artifactory
 * azurerm
 * consul
 * cos
 * etcd
 * etcdv3
 * gcs
 * http
 * kubernetes
 * manta
 * oss
 * pg
 * s3
 * swift

Most of the standard backends supports [`state locking`](https://www.terraform.io/docs/state/locking.html), but need to check them individually to be more specific.

## Terraform Workspace

With terraform workspace we can manage different states for the same IAC which can be applied to different infrastructures. 

> #### Note:
> In analogy, we can think terrafrom workspace as equivalent to git branches for the `state files` 

`terraform workspace --help ` will list all the subcommands and 
we can switch between workspaces.

> ### Note: 
> Initial workspace is always called as `default`. 
  
 we can create new workspace with :
```bash
terraform workspace new foobar
```
we can list workspaces with :
```bash
terraform workspace list
```

and switch to the desired or required workspace with:
```
terraform workspace select <name-of-the-workspace>
```

## [Terraform cloud](https://www.terraform.io/cloud) 

[Terraform Cloud](https://www.terraform.io/cloud) is HashiCorp’s managed service offering that eliminates the need for unnecessary tooling and documentation to use Terraform in production.

It has a very good integration with all major source control providers [`github`, `gitlab`,`bitbucket`]  and it's easier to perform `CI/CD` in cloud with remote state with support to locking and scaling with collabration with team members too. 