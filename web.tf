resource "aws_instance" "web" {
  ami           = "ami-0f5ee92e2d63afc18" # Change if needed
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.public.id
  security_groups = [aws_security_group.web_sg.name]

  tags = {
    Name = "web-tier-instance"
  }
}

# Optional: Auto Scaling Group (basic example)
resource "aws_autoscaling_group" "web_asg" {
  desired_capacity     = 1
  max_size             = 2
  min_size             = 1
  vpc_zone_identifier  = [aws_subnet.public.id]
  launch_configuration = aws_launch_configuration.web_lc.id
}

resource "aws_launch_configuration" "web_lc" {
  name          = "web-lc"
  image_id      = "ami-0f5ee92e2d63afc18"
  instance_type = var.instance_type
  key_name      = var.key_name
  security_groups = [aws_security_group.web_sg.id]
}
