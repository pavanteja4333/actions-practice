terraform {
  required_version = " 1.14.0"

  required_providers {
    aws ={
        source = "hashicorp/aws"
        version = "~> 6.41"
    }
  }

  backend "s3" {
    bucket = "digistackpavan1234tej"
    key = "test/terraform.tfstate"
    region = "us-west-1"
    encrypt = true
    use_lockfile = true
    
  }
}
