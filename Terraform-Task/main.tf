


# Provider 1 - Mumbai Region
provider "aws" {
  alias  = "mumbai"
  region = "ap-south-1"
}

# Provider 2 - N. Virginia Region
provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
}

# EC2 in Mumbai
resource "aws_instance" "mumbai_instance" {
  provider      = aws.mumbai
  ami           = "ami-0522ab6e1ddcc7055"
  instance_type = "t3.micro"

  tags = {
    Name = "Terraform-Mumbai-EC2"
  }
}

# EC2 in N. Virginia
resource "aws_instance" "virginia_instance" {
  provider      = aws.virginia
  ami           = "ami-0e2c8caa4b6378d8c"
  instance_type = "t3.micro"

  tags = {
    Name = "Terraform-Virginia-EC2"
  }
}

# Output - Mumbai
output "mumbai_instance_id" {
  value = aws_instance.mumbai_instance.id
}

output "mumbai_public_ip" {
  value = aws_instance.mumbai_instance.public_ip
}

# Output - Virginia
output "virginia_instance_id" {
  value = aws_instance.virginia_instance.id
}

output "virginia_public_ip" {
  value = aws_instance.virginia_instance.public_ip
}

