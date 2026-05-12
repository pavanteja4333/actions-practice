resource "aws_instance" "digi_instance" {

    ami = "ami-08399392f867d1d1f"
    instance_type = "t3.micro"

    tags = {
      Name = "pavan-system"
    }
  
}


