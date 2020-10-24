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