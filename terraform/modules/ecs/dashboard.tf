resource "aws_cloudwatch_dashboard" "ecs_dashboard" {
  dashboard_name = "${var.project_name}-ecs-dashboard-jayani"

  dashboard_body = jsonencode({
    widgets = [
      {
        type = "metric"
        x    = 0
        y    = 0
        width  = 12
        height = 6

        properties = {
          metrics = [
            ["ECS/ContainerInsights", "CPUUtilization", "ClusterName", aws_ecs_cluster.this.name, "ServiceName", aws_ecs_service.this.name],
            ["ECS/ContainerInsights", "MemoryUtilization", "ClusterName", aws_ecs_cluster.this.name, "ServiceName", aws_ecs_service.this.name]
          ]
          period = 300
          stat   = "Average"
          region = var.aws_region
          title  = "ECS CPU & Memory Utilization"
        }
      },
      {
        type = "metric"
        x    = 0
        y    = 6
        width  = 12
        height = 6

        properties = {
          metrics = [
            ["ECS/ContainerInsights", "RunningTaskCount", "ClusterName", aws_ecs_cluster.this.name, "ServiceName", aws_ecs_service.this.name]
          ]
          period = 300
          stat   = "Average"
          region = var.aws_region
          title  = "ECS Running Task Count"
        }
      },
      {
        type = "metric"
        x    = 12
        y    = 0
        width  = 12
        height = 6

        properties = {
          metrics = [
            ["ECS/ContainerInsights", "NetworkIn", "ClusterName", aws_ecs_cluster.this.name, "ServiceName", aws_ecs_service.this.name],
            ["ECS/ContainerInsights", "NetworkOut", "ClusterName", aws_ecs_cluster.this.name, "ServiceName", aws_ecs_service.this.name]
          ]
          period = 300
          stat   = "Sum"
          region = var.aws_region
          title  = "ECS Network In / Out"
        }
      }
    ]
  })
}