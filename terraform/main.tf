module "vpc" {
    source = "./modules/vpc"
}

module "ecr" {
    source = "./modules/ecr"
}

module "ecs" {
    source    = "./modules/ecs"
    vpc_id    = module.vpc.vpc_id
    subnets   = module.vpc.subnets
    image_uri = var.image_uri
}
