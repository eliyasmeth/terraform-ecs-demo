resource "aws_route53_record" "farm_record" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "farm.${var.domain}"
  type    = "CNAME"
  ttl     = 300
  records = [aws_lb.main_lb.dns_name]
}

resource "aws_route53_record" "water_record" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "water.${var.domain}"
  type    = "CNAME"
  ttl     = 300
  records = [aws_lb.main_lb.dns_name]
}

resource "aws_route53_record" "backend_record" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "backend.${var.domain}"
  type    = "CNAME"
  ttl     = 300
  records = [aws_lb.main_lb.dns_name]
}