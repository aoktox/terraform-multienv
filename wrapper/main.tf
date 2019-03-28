locals {
  environment = "${lookup(var.environment_map, terraform.workspace, "dev")}"
  vm_size     = "${lookup(var.vm_size_map, local.environment)}"
}

output "current_workspace" {
  value = "${terraform.workspace}"
}

output "environment" {
  value = "${local.environment}"
}

output "vm_size" {
  value = "${local.vm_size}"
}
