variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "ecs_security_group_id" {
  type = string
}

variable "db_name" {
  type    = string
  default = "strapi"
}

variable "db_username" {
  type    = string
  default = "strapiuser"
}
