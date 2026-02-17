variable "aws_region" {
  default = "us-east-1"
}

variable "project_name" {
  type = string
}

variable "image_uri" {
  description = "Docker image URI from GitHub Actions"
  type        = string
}
