variable "namespace" {}

variable "stage" {}

variable "name" {}

variable "dir" {}

variable "bucket" {}

variable "backup_enabled" {
  default = false
}

variable "backup_frequency" {
  default = "0 0 1 * *"
}

variable "ssh_user" {}
