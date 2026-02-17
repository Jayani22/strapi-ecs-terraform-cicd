terraform {
  backend "s3" {
    bucket  = "strapi-ecs-tfstate-385046010663"
    key     = "strapi-ecs/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
