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

