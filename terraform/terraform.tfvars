aws_region   = "us-east-1"
project_name = "strapi"
image_uri   = "public.ecr.aws/docker/library/nginx:latest"
vpc_id = "vpc-01f07742b1072b8ab"
subnet_ids = [
    "subnet-0623ab3807e8e0f73",
    "subnet-0de329ded24cd0e1e"
]

execution_role_arn = "arn:aws:iam::811738710312:role/ecs_fargate_taskRole"