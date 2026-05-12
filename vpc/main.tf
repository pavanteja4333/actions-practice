resource "aws_vpc" "pavan_vpc" {
  cidr_block = var.cidr
  enable_dns_hostnames = true
  enable_dns_support = true
  
   tags = var.vpc_tag
}

resource "aws_subnet" "pavan_vpc_subnet" {
  cidr_block = "10.100.1.0/24"
  availability_zone = "ap-south-1a"
  vpc_id = aws_vpc.pavan_vpc.id
  map_public_ip_on_launch = true
 tags = {
    Name = "pavan_vpc_subnet"
  }
}
  
resource "aws_instance" "pavan_instance" {
  instance_type = var.instance_type
  ami = "ami-03793655b06c6e29a"
  key_name = "terraform"
  subnet_id = aws_subnet.pavan_vpc_subnet.id
  vpc_security_group_ids = [aws_security_group.instance_sg.id]
  tags = var.tags
}

resource "aws_security_group" "instance_sg" {
  name        = "${aws_vpc.pavan_vpc.name}-security_group" 
  description = "Allowing SSH traffic"
  vpc_id      = aws_vpc.pavan_vpc.id


  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }




  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "pavan_vpc_sg"
  }
}

resource "aws_internet_gateway" "pavan_igw" {
  vpc_id = aws_vpc.pavan_vpc.id

  tags = {
    Name = "pavan_igw"
  }
}

resource "aws_route_table" "pavan_public_rt" {
  vpc_id = aws_vpc.pavan_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.pavan_igw.id
  }

  tags = {
    Name = "pavan_public_rt"
  }
}

resource "aws_route_table_association" "pavan_public_assoc" {
  subnet_id      = aws_subnet.pavan_vpc_subnet.id
  route_table_id = aws_route_table.pavan_public_rt.id
}
