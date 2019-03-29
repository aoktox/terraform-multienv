resource "random_id" "id" {
  byte_length = 8
}

output "current_workspace" {
  value = "${terraform.workspace}"
}

output "environment" {
  value = "${var.environment}"
}

output "vm_size" {
  value = "${var.vm_size}"
}

output "random_val" {
  value = "${random_id.id.hex}"
}
