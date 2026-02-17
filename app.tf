resource "aws_instance" "app" {
  ami           = "ami-0f5ee92e2d63afc18" # Change according to region
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.private.id
  security_groups = [aws_security_group.app_sg.name]

  tags = {
    Name = "app-tier-instance"
  }
}

# Optional: Auto Scaling for App Tier
resource "aws_launch_configuration" "app_lc" {
  name          = "app-lc"
  image_id      = "ami-0f5ee92e2d63afc18"
  instance_type = var.instance_type
  key_name      = var.key_name
  security_groups = [aws_security_group.app_sg.id]
}

resource "aws_autoscaling_group" "app_asg" {
  desired_capacity     = 1
  max_size             = 2
  min_size             = 1
  vpc_zone_identifier  = [aws_subnet.private.id]
  launch_configuration = aws_launch_configuration.app_lc.id
}
