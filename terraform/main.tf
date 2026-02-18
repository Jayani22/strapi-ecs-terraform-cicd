module "vpc" {
    source       = "./modules/vpc"
    project_name = var.project_name
    aws_region   = var.aws_region
}

module "ecr" {
    source       = "./modules/ecr"
    project_name = var.project_name
}

module "iam" {
    source       = "./modules/iam"
    project_name = var.project_name
}

module "ecs" {
    source             = "./modules/ecs"
    project_name       = var.project_name
    aws_region         = var.aws_region
    image_uri          = var.image_uri

    vpc_id             = var.vpc_id
    subnet_ids         = var.subnet_ids
    execution_role_arn = var.execution_role_arn
}

