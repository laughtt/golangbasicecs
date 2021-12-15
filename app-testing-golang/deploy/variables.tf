variable "prefix" {
  type        = string
  description = "startup-project"
}

variable "contact" {
  type        = string
  description = "email@londonappdev.com"
}

variable "region" {
  default     = "us-east-1"
  description = "region"
}

variable "db_host" {
  type        = string
  description = ""
}
variable "db_name" {
  type        = string
  description = ""
}
variable "db_user" {
  type        = string
  description = ""
}
variable "db_pass" {
  type        = string
  description = ""
}
variable "container_port" {
  type        = number
  description = ""
}

variable "desire_count" {
  type        = number
  description = ""
}
variable "memory_reservation" {
  type        = number
  description = ""
}
variable "memory" {
  type        = number
  description = ""
}

variable "lb_listener_port" {
  type        = number
  description = ""
}

variable "health_check_path" {
  type        = string
  description = ""
}

variable "resource_api_gateway_path" {
  type        = string
  description = ""
}

variable "repo_url" {
  type        = string
  description = ""
}
variable "repo_id" {
  type        = string
  description = ""
}
