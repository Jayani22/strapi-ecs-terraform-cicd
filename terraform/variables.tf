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

variable "execution_role_arn" {
  type = string
}
