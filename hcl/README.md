## terraform folder structure

So, for starters the terraform folder consists of 
* main.tf 
* variables.tf 
* outputs.tf

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
