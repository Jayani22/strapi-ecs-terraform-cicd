aws_region   = "us-east-1"
project_name = "strapi"
image_uri   = "public.ecr.aws/docker/library/nginx:latest"
vpc_id = "vpc-0b5c422c6de590c86"
subnet_ids = [
    "subnet-0402e41a2030320e1",
    "subnet-0bd1d62f09edf1c2b"
]

execution_role_arn = "arn:aws:iam::811738710312:role/ecs_fargate_taskRole"