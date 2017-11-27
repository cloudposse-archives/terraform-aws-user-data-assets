variable "namespace" {}

variable "stage" {}

variable "name" {}

variable "dir" {
  description = "Directory path where assets stored on server"
}

variable "bucket" {
  description = "S3 bucket to store assets"
}

variable "backup_enabled" {
  default     = false
  description = "Enable backup assets to s3 on cron"
}

variable "backup_frequency" {
  default     = "0 0 1 * *"
  description = "Frequency backup assets on cron"
}

variable "ssh_user" {
  description = "User that used to execute backup cron"
}

variable "flavor" {
  default     = "debian-systemd"
  description = "Flavor depends of OS and init system"
}
