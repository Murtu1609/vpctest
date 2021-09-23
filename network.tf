

provider "aws" {
  region     = "eu-west-2"
  //access_key = var.access_key
  //secret_key = var.secret_key

  /*assume_role {
    role_arn     = var.delegated_role
    
  }*/

}

terraform {
  backend "s3" {
    bucket = "murtuterraformstates"
    key    = "tfstates/testvpc.tfstate"
    region = "eu-west-2"
  

  }
 
}

resource "aws_vpc" "vpc" {
  cidr_block = "10.10.0.0/16"
enable_dns_hostnames = true

  tags = {
    Name = "testvpc"
  }
}

