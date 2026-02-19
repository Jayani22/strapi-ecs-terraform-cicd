output "db_endpoint" {
    value = aws_db_instance.this.address
}

output "db_username" {
    value = var.db_username
}

output "db_password" {
    value     = random_password.db_password.result
    sensitive = true
}

output "db_name" {
    value = var.db_name
}
