resource "aws_route53_zone" "main" {
  name = var.domain
}

resource "aws_acm_certificate" "main_cert" {
  domain_name       = var.domain
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "${var.project_name}-certificate"
  }
}

resource "aws_acm_certificate_validation" "main_cert_validation" {
  certificate_arn         = aws_acm_certificate.main_cert.arn
  validation_record_fqdns = [aws_route53_zone.main.name]
}