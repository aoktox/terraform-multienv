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
$ terraform plan
```
```sh
$ terraform apply
```