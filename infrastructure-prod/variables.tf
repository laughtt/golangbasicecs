variable "prefix" {
  description = "1.0.0"
}

variable "project" {
  description = "startup-project"
}

variable "contact" {
  description = "email@londonappdev.com"
}

variable "region" {
  default     = "us-east-1"
  description = "region"
}

variable "name" {
  description = "database name"
}
variable "username" {
  description = "database username"
}
variable "password" {
  description = "database password"
}

variable "instance_class" {
  description = ""
}
variable "deletion_protection" {
  description = ""
}
