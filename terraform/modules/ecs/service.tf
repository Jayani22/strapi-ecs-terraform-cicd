resource "aws_ecs_service" "this" {
    name            = "${var.project_name}-service"
    cluster         = aws_ecs_cluster.this.id
    task_definition = aws_ecs_task_definition.this.arn
    desired_count   = 1
    launch_type     = "FARGATE"
    health_check_grace_period_seconds = 180


    network_configuration {
        subnets          = var.subnet_ids
        security_groups  = [aws_security_group.ecs.id]
        assign_public_ip = true
    }

    load_balancer {
        target_group_arn = aws_lb_target_group.this.arn
        container_name   = "strapi"
        container_port   = 1337
    }

    depends_on = [aws_lb_listener.http]
}
