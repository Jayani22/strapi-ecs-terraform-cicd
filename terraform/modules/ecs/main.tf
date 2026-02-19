resource "aws_ecs_cluster" "this" {
  name = "${var.project_name}-cluster-jayani"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_cloudwatch_log_group" "ecs" {
  name              = "/ecs/${var.project_name}-jayani"
  retention_in_days = 7
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
            { name = "DATABASE_CLIENT", value = "postgres" },
            { name = "DATABASE_HOST", value = var.db_endpoint },
            { name = "DATABASE_PORT", value = "5432" },
            { name = "DATABASE_NAME", value = var.db_name },
            { name = "DATABASE_USERNAME", value = var.db_username },
            { name = "DATABASE_PASSWORD", value = var.db_password },
        ]

        logConfiguration = {
            logDriver = "awslogs"
            options = {
                awslogs-group = aws_cloudwatch_log_group.ecs.name
                awslogs-region        = var.aws_region
                awslogs-stream-prefix = "ecs"
            }
        }
    }])
}
