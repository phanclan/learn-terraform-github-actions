terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
    }
  }
  backend "remote" {
    organization = "pphan"

    workspaces {
      name = "sub-1"
    }
  }
}
resource "random_pet" "server" {
  length = var.pet_name_length
  prefix = var.prefix
}
# variables.tf
variable "pet_name_length" {
  type    = string
  default = "2"
}
variable "prefix" {
  default = "test"
}
# output.tf
output "server" {
  value = random_pet.server.id
}
output "workspace" {
  value = "sub-1 "
}
