module "ecs" {
    source             = "./modules/ecs"
    project_name       = var.project_name
    aws_region         = var.aws_region
    image_uri          = var.image_uri
    vpc_id             = var.vpc_id
    subnet_ids         = var.subnet_ids
    execution_role_arn = var.execution_role_arn
    db_endpoint  = module.rds.db_endpoint
    db_username  = module.rds.db_username
    db_password  = module.rds.db_password
    db_name      = module.rds.db_name
}

module "rds" {
    source = "./modules/rds"
    vpc_id                = var.vpc_id
    subnet_ids            = var.subnet_ids
    ecs_security_group_id = module.ecs.ecs_security_group_id
}

