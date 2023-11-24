terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

# 1. create aws vpc with 10.0.0.0/8 and name as thxcode-testing;

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/8"
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true
  
  tags = {
    Name = "thxcode-testing"
  }
}

# 2. create 3 aws subnets under the above created vpc;

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.2.0/24"
}

resource "aws_subnet" "subnet3" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.3.0/24"
}

# 3. output the id of the vpc created by step 1.

output "vpc_id" {
  value = aws_vpc.my_vpc.id
}
