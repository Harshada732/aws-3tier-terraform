resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "three-tier-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "three-tier-igw"
  }
}
