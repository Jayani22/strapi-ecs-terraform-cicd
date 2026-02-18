resource "aws_ecr_repository" "this" {
  name = "${var.project_name}-repo-jayani"
  force_delete = true
}
