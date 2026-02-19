variable "project_name" {

}
variable "aws_region" {

}
variable "image_uri" {

}
variable "execution_role_arn" {

}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "db_endpoint" {

}

variable "db_username" {

}

variable "db_password" {
  sensitive = true
}

variable "db_name" {

}