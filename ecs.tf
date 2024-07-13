
resource "aws_ecs_cluster" "main_ecs" {
  name = "${var.project_name}-cluster"

  tags = {
    Name = "${var.project_name}-ecs-cluster"
  }
}

resource "aws_ecs_task_definition" "farm_task" {
  family                   = "farm"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  container_definitions = jsonencode([
    {
      name   = "farm"
      image  = "${aws_ecr_repository.farm_ecr.repository_url}:latest"
      cpu    = 256
      memory = 512
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])

  tags = {
    Name = "${var.project_name}-farm-task"
  }
}

resource "aws_ecs_task_definition" "water_task" {
  family                   = "water"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  container_definitions = jsonencode([
    {
      name   = "water"
      image  = "${aws_ecr_repository.water_ecr.repository_url}:latest"
      cpu    = 256
      memory = 512
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])

  tags = {
    Name = "${var.project_name}-water-task"
  }
}

resource "aws_ecs_task_definition" "backend_task" {
  family                   = "backend"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "512"
  memory                   = "1024"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  container_definitions = jsonencode([
    {
      name   = "backend"
      image  = "${aws_ecr_repository.backend_ecr.repository_url}:latest"
      cpu    = 512
      memory = 1024
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])

  tags = {
    Name = "${var.project_name}-backend-task"
  }
}

resource "aws_ecs_service" "farm_service" {
  name            = "farm"
  cluster         = aws_ecs_cluster.main_ecs.id
  task_definition = aws_ecs_task_definition.farm_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"
  network_configuration {
    subnets          = [aws_subnet.private1_1a.id, aws_subnet.private1_1b.id]
    security_groups  = [aws_security_group.ecs_sg.id]
    assign_public_ip = false
  }

  tags = {
    Name = "${var.project_name}-farm-service"
  }
}

resource "aws_ecs_service" "water_service" {
  name            = "water"
  cluster         = aws_ecs_cluster.main_ecs.id
  task_definition = aws_ecs_task_definition.water_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"
  network_configuration {
    subnets          = [aws_subnet.private1_1a.id, aws_subnet.private1_1b.id]
    security_groups  = [aws_security_group.ecs_sg.id]
    assign_public_ip = false
  }

  tags = {
    Name = "${var.project_name}-water-service"
  }
}

resource "aws_ecs_service" "backend_service" {
  name            = "backend"
  cluster         = aws_ecs_cluster.main_ecs.id
  task_definition = aws_ecs_task_definition.backend_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"
  network_configuration {
    subnets          = [aws_subnet.private1_1a.id, aws_subnet.private2_1b.id]
    security_groups  = [aws_security_group.ecs_sg.id]
    assign_public_ip = false
  }

  tags = {
    Name = "${var.project_name}-backend-service"
  }
}