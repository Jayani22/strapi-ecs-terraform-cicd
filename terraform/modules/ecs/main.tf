resource "aws_ecs_cluster" "main" {
    name = "strapi-cluster"
}

resource "aws_cloudwatch_log_group" "logs" {
    name = "/ecs/strapi"
}

resource "aws_iam_role" "ecs_execution" {
    name = "ecsTaskExecutionRole"

    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [{
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
            Service = "ecs-tasks.amazonaws.com"
        }
        }]
    })
}

resource "aws_iam_role_policy_attachment" "ecs_execution_policy" {
    role       = aws_iam_role.ecs_execution.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_ecs_task_definition" "strapi" {
    family                   = "strapi-task"
    requires_compatibilities = ["FARGATE"]
    network_mode             = "awsvpc"
    cpu                      = "512"
    memory                   = "1024"
    execution_role_arn       = aws_iam_role.ecs_execution.arn

    container_definitions = jsonencode([
        {
            name  = "strapi"
            image = var.image_uri

            portMappings = [
            {
                containerPort = 1337
            }
        ]
        }
    ])
}

resource "aws_security_group" "ecs" {
    vpc_id = var.vpc_id

    ingress {
        from_port   = 1337
        to_port     = 1337
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port   = 0
        protocol  = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_ecs_service" "strapi" {
    name            = "strapi-service"
    cluster         = aws_ecs_cluster.main.id
    task_definition = aws_ecs_task_definition.strapi.arn
    launch_type     = "FARGATE"
    desired_count   = 1

    network_configuration {
        subnets         = var.subnets
        security_groups = [aws_security_group.ecs.id]
        assign_public_ip = true
    }
}