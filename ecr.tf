resource "aws_ecr_repository" "farm_ecr" {
  name = "${var.project_name}-farm-ecr"

  tags = {
    Name = "${var.project_name}-farm-ecr"
  }
}

resource "aws_ecr_repository" "water_ecr" {
  name = "${var.project_name}-water-ecr"

  tags = {
    Name = "${var.project_name}-water-ecr"
  }
}

resource "aws_ecr_repository" "backend_ecr" {
  name = "${var.project_name}-backend-ecr"

  tags = {
    Name = "${var.project_name}-backend-ecr"
  }
}