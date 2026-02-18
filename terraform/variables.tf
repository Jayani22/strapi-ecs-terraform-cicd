variable "aws_region" {
  type = string
}

variable "project_name" {
  type = string
}

variable "image_uri" {
  description = "Docker image URI from GitHub Actions"
  type        = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "execution_role_arn" {
  type = string
}
