resource "aws_ecs_cluster" "this" {
    name = "${var.project_name}-cluster-jayani"
}

resource "random_password" "app_keys" {
  length  = 32
  special = false
}

resource "random_password" "api_token_salt" {
  length  = 32
  special = false
}

resource "random_password" "admin_jwt_secret" {
  length  = 32
  special = false
}

resource "random_password" "transfer_token_salt" {
  length  = 32
  special = false
}

resource "random_password" "jwt_secret" {
  length  = 32
  special = false
}

resource "aws_ecs_task_definition" "this" {
    family                   = "${var.project_name}-task-jayani"
    requires_compatibilities = ["FARGATE"]
    network_mode             = "awsvpc"
    cpu                      = "1024"
    memory                   = "2048"
    execution_role_arn       = var.execution_role_arn

    container_definitions = jsonencode([{
        name  = "strapi"
        image = var.image_uri

        portMappings = [{
            containerPort = 1337
        }]

        environment = [
            { name = "HOST", value = "0.0.0.0" },
            { name = "PORT", value = "1337" },

            { name = "APP_KEYS", value = random_password.app_keys.result },
            { name = "API_TOKEN_SALT", value = random_password.api_token_salt.result },
            { name = "ADMIN_JWT_SECRET", value = random_password.admin_jwt_secret.result },
            { name = "TRANSFER_TOKEN_SALT", value = random_password.transfer_token_salt.result },
            { name = "JWT_SECRET", value = random_password.jwt_secret.result }
        ]


        logConfiguration = {
            logDriver = "awslogs"
            options = {
                awslogs-group = "/ecs/${var.project_name}"
                awslogs-region        = var.aws_region
                awslogs-stream-prefix = "ecs"
            }
        }
    }])

}
