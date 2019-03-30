# Command
- Creating workspace
```sh
$ terraform workspace new {{environment_name}}
```

- Switching workspace
```sh
$ terraform workspace select {{environment_name}}
```

- Or you can use this command to create workspace if doesn't exist
```sh
terraform workspace select {{environment_name}} || terraform workspace new {{environment_name}}
```

- Terraform execution
```sh
$ terraform plan -var-file="{{environment_name}}.tfvars"
```
```sh
$ terraform apply -var-file="{{environment_name}}.tfvars"
```

## Using wrapper
```sh
➜  wrapper$ make
apply                          Run an execution
destroy                        Destroy everything
help                           Show this help
plan                           Plan an execution
prep                           Prepare a new workspace (environment)
```

-  Terraform execution
```sh
$ ENV=dev make plan
```
```sh
$ ENV=dev make apply
```
```sh
$ ENV=dev make destroy
```

> no need to create workspace manually when using wrapper