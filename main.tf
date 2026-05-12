resource "aws_instance" "digi_instance" {

    ami = "ami-08399392f867d1d1f"
    instance_type = "t3.micro"
    key_name = "nit"
    subnet_id = aws_subnet.pavan_vpc_subnet.id
    vpc_security_group_ids = [aws_security_group.instance_sg.id]

    tags = {
      Name = "pavan-system"
    }
  
}


module "vpc" {
  source = "./vpc"
}

