resource "aws_ecr_repository" "this" {
  name = "${var.project_name}-repo"
  force_delete = true
}
