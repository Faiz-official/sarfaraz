resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "Sarfaraz-VPC"
  }
}

resource "aws_subnet" "subnet" {
  count                   = 4
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.all_subnets[count.index]
  availability_zone       = var.availability_zones[count.index % length(var.availability_zones)]
  map_public_ip_on_launch = count.index < 2

  tags = {
    Name = count.index < 2 ? "Public-Subnet-${count.index + 1}" : "Private-Subnet-${count.index - 1}"
  }
}

resource "aws_security_group" "web_sg" {
  vpc_id = aws_vpc.main.id
  name   = "web-sg"

  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = var.allowed_cidrs
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.allowed_cidrs
  }
  tags = {
    Name = "Sarfaraz-Web-Security-Group"
  }
}
