# Terraform multi environment using workspace
In this repo, i give example how to dealing with multiple environment when using terraform as your IaC.

## Ingredients
What this repo is made of

- Terraform workspace
- Terraform interpolation (`lookup`)
- Makefile


## Directory stucture
```
➜ terraform-multienv $ tree
.
├── map
│   ├── main.tf
│   ├── terraform.tfstate.d       => workspace state file location
│   │   ├── dev
│   │   ├── prod
│   │   └── staging
│   └── variables.tf
├── README.md
└── wrapper
    ├── dev.tfvars
    ├── main.tf
    ├── Makefile
    ├── prod.tfvars
    ├── staging.tfvars
    ├── terraform.tfstate.d       => workspace state file location
    │   ├── dev
    │   ├── prod
    │   └── staging
    └── variables.tf

10 directories, 9 files
```

> There are 2 examples scenario when dealing with terraform for multiple environment

### map
- in this directory i use resources mapping based on the environment in `variables.tf`
- using `lookup` function to get correct value based on environment and store it in `local`

### wrapper
- in this folder I separate values based on variable file
  > dev.tfvars

  > staging.tfvars

  > prod.tfvars

- create `Makefile` as a wrapper for executing terraform command

## Pros and Cons
> Please try and find it by yourself :D


### References
- [Terraform docs](https://www.terraform.io/docs/state/workspaces.html)
- [Medium article](https://medium.com/capital-one-tech/deploying-multiple-environments-with-terraform-kubernetes-7b7f389e622)
- [Another article](http://saurabh-hirani.github.io/writing/2017/08/02/terraform-makefile)