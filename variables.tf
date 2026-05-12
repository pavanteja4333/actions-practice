variable "cidr" {
    description = "cidr for vpc"
    type = string
    default = "10.100.0.0/16"
  
}

variable "tags" {
  description = "tags for my instance"
  type = object({
    name = string
  })

  default = {
    name = "pavan"
  }
}

variable "vpc_tag" {
  description = "tags for my vpc"
  type = object({
    name = string
  })

  default = {
    name = "pavan_vpc"
  }
}
variable "instance_type" {
    description = "this variables has instance type"
    type = string
    default = "t2.micro"
  
}

variable "region" {
    description = "region for the vpc"
    type = string
    default = "ap-south-1"

}

