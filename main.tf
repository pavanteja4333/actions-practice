resource "aws_instance" "digi_instance" {

    ami = "ami-03793655b06c6e29a"
    instance_type = "t3.micro"

    tags = {
      Name = "akhil-system"
    }
  
}


