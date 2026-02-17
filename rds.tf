resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "db-subnet-group"
  subnet_ids = [aws_subnet.private.id]

  tags = {
    Name = "db-subnet-group"
  }
}

resource "aws_db_instance" "mysql_db" {
  identifier              = "three-tier-db"
  engine                  = "mysql"
  instance_class          = "db.t2.micro"
  allocated_storage       = 20
  name                    = "mydb"
  username                = "admin"
  password                = "Admin1234!"  # Use secrets in production
  db_subnet_group_name    = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.db_sg.id]
  skip_final_snapshot     = true
}
