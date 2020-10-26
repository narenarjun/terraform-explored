## Importants 

### terraform folder structure

So, for starters the terraform folder consists of

- main.tf
- variables.tf
- outputs.tf

If the `main.tf` file gets bigger than we might use additional `.tf` files, but that's the good time to start using
terraform modules.

### output

created `S3` bucket and used output to get the needed values.
data sources needs to be started with `data.<sourcetype>.<label>`
resources are mentioned as `<resourcename>.<labelname>`

### interpolation

Substitute values in strings.

prior to terraform v0.12, even cross mentioning of resources that don't have interpolation has to be mentioned inside `"${<value to be shared or used here>}"`.
as of terraform v0.12 or later this was removed, only interoplations need these.

### Variables

> ## 📚 Note
>
> Terraform 0.11 and earlier required type constraints to be given in quotes,
> but that form is now deprecated and will be removed in a future version of  
> Terraform. To silence this warning, remove the quotes around "string".

### Locals

locals are like the variables in other programming like js and python.

by convention all the local are declared on the top of the `.tf` file.

### Count

Count can be used a iterator in the terraform file.
This will be useful in reducing code duplication.

### Data types

These are the data types supported by hcl in terraform.

- string
- number
- boolean
- list -> can be of mixed types
- map -> can contain simple data types or can be complex such as list and other maps too

### Conditional Logics 

There is no conditional branches like `if` or `else` in `hcl`, but we can use `ternary` operators.

### Functions

Terraform has 100+ built in functions (but no ability to define custom functions!)
 https://www.terraform.io/docs/configuration/functions.html .
 The syntax for a function call is <function_name>(<arg1>, <arg2>).