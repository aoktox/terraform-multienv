variable "environment_map" {
  type = "map"

  default = {
    default = "dev"
    staging = "staging"
    prod    = "prod"
  }
}

variable "vm_size_map" {
  type = "map"

  default = {
    default = "small"
    staging = "large"
    prod    = "xlarge"
  }
}
