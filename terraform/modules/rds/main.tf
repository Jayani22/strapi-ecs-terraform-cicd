resource "aws_db_subnet_group" "this" {
    name       = "strapi-db-subnet-group-jayani"
    subnet_ids = data.aws_subnets.default.ids
}

resource "random_password" "db_password" {
  length  = 16
  special = false
}

resource "aws_security_group" "rds" {
    name   = "strapi-rds-sg-jayani"
    vpc_id = data.aws_vpc.default.id

    ingress {
        from_port       = 5432
        to_port         = 5432
        protocol        = "tcp"
        security_groups = [var.ecs_security_group_id]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_db_instance" "this" {
    identifier              = "strapi-postgres-jayani"
    engine                  = "postgres"
    engine_version          = "15"
    instance_class          = "db.t3.micro"
    allocated_storage       = 20
    db_name                 = var.db_name
    username                = var.db_username
    password                = random_password.db_password.result
    skip_final_snapshot     = true
    publicly_accessible     = false
    db_subnet_group_name    = aws_db_subnet_group.this.name
    vpc_security_group_ids  = [aws_security_group.rds.id]
    multi_az                = false
    storage_encrypted       = true
}
