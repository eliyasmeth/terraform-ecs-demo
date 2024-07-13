output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main_vpc.id
}

output "public_subnets" {
  description = "The IDs of the public subnets"
  value       = [aws_subnet.public_1a.id, aws_subnet.public_1b.id]
}

output "private_subnets" {
  description = "The IDs of the private subnets"
  value       = [aws_subnet.private1_1a.id, aws_subnet.private2_1a.id, aws_subnet.private1_1b.id, aws_subnet.private2_1b.id]
}

output "load_balancer_dns_name" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.main_lb.dns_name
}

output "ecs_cluster_name" {
  description = "The name of the ECS cluster"
  value       = aws_ecs_cluster.main_ecs.name
}

output "s3_bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.main_bucket.bucket
}

output "ecr_farm_repository_url" {
  description = "The URL of the ECR repository"
  value       = aws_ecr_repository.farm_ecr.repository_url
}

output "ecr_water_repository_url" {
  description = "The URL of the ECR repository"
  value       = aws_ecr_repository.water_ecr.repository_url
}

output "ecr_backend_repository_url" {
  description = "The URL of the ECR repository"
  value       = aws_ecr_repository.backend_ecr.repository_url
}

output "rds_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = aws_db_instance.postgres.endpoint
}