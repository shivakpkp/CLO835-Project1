resource "aws_vpc" "aws_vpc_name" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  tags = {
    Name = "vpc-${var.aws_vpc_name}"
  }
  
}

resource "aws_subnet" "aws_subnet_block" {
  cidr_block        = var.cidr_subnet_block
  vpc_id            = aws_vpc.aws_vpc_name.id
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.aws_vpc_name}-sub"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.aws_vpc_name.id
  tags = {
    Name = "vpc-${var.aws_vpc_name}"
  }
}

