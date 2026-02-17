resource "aws_ecs_cluster" "this" {
    name = "${var.project_name}-cluster"
}

resource "aws_cloudwatch_log_group" "this" {
    name = "/ecs/${var.project_name}"
}

resource "aws_ecs_task_definition" "this" {
    family                   = "${var.project_name}-task"
    requires_compatibilities = ["FARGATE"]
    network_mode             = "awsvpc"
    cpu                      = "512"
    memory                   = "1024"
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

            { name = "APP_KEYS", value = "key1,key2,key3,key4" },
            { name = "API_TOKEN_SALT", value = "randomsalt" },
            { name = "ADMIN_JWT_SECRET", value = "adminsecret" },
            { name = "TRANSFER_TOKEN_SALT", value = "transfersalt" },
            { name = "JWT_SECRET", value = "jwtsecret" }
        ]

        logConfiguration = {
            logDriver = "awslogs"
            options = {
            awslogs-group         = aws_cloudwatch_log_group.this.name
            awslogs-region        = var.aws_region
            awslogs-stream-prefix = "ecs"
            }
        }
    }])

}
