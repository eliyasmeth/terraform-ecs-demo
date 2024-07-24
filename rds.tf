
resource "aws_db_instance" "postgres" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "postgres"
  instance_class         = "db.t3.micro"
  db_name                = "${var.project_name}db"
  username               = var.db_user
  password               = var.db_password
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.postgres_db_sg.name
  multi_az               = false
  publicly_accessible    = false

  tags = {
    Name = "${var.project_name}-postgres-db"
  }
}

resource "aws_db_subnet_group" "postgres_db_sg" {
  name       = "${var.project_name}-db-subnet-group"
  subnet_ids = [aws_subnet.private2_1a.id, aws_subnet.private2_1b.id]

  tags = {
    Name = "${var.project_name}-postgres-db-sg"
  }
}