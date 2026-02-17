# Web Tier Public IP
output "web_instance_public_ip" {
  value = aws_instance.web.public_ip
}

# App Tier Private IP
output "app_instance_private_ip" {
  value = aws_instance.app.private_ip
}

# Load Balancer DNS
output "alb_dns_name" {
  value = aws_lb.web_alb.dns_name
}

# Database Endpoint
output "db_endpoint" {
  value = aws_db_instance.mysql_db.endpoint
}
