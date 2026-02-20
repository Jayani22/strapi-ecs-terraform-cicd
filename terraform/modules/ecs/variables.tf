variable "project_name" {

}
variable "aws_region" {

}
variable "image_uri" {

}
variable "execution_role_arn" {

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
variable "vpc_id" {

}

variable "subnet_ids" {
  type = list(string)
}