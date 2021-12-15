resource "aws_ecr_repository" "app-repo" {
  name                 = "${local.prefix}-app-repository"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }

  tags = merge(
    local.common_tags,
    map("Name", "${local.prefix}")
  )
}

resource "aws_ecr_repository" "app-repo-go" {
  name                 = "${local.prefix}-app-repository-go"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }

  tags = merge(
    local.common_tags,
    map("Name", "${local.prefix}")
  )
}
