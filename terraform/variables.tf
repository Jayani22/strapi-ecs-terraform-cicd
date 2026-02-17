variable "aws_region" {
    default = "us-east-1"
}

variable "image_uri" {
    description = "Docker image URI from GitHub Actions"
    type        = string
}
