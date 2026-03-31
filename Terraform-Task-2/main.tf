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

# EC2 in Mumbai with Nginx
resource "aws_instance" "mumbai_instance" {
  provider      = aws.mumbai
  ami           = "ami-0522ab6e1ddcc7055"
  instance_type = "t3.micro"

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y nginx
              systemctl start nginx
              systemctl enable nginx
              echo "<h1>Nginx Running on Mumbai EC2 - Terraform</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "Terraform-Mumbai-Nginx"
  }
}

# EC2 in N. Virginia with Nginx
resource "aws_instance" "virginia_instance" {
  provider      = aws.virginia
  ami           = "ami-0e2c8caa4b6378d8c"
  instance_type = "t3.micro"

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y nginx
              systemctl start nginx
              systemctl enable nginx
              echo "<h1>Nginx Running on Virginia EC2 - Terraform</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "Terraform-Virginia-Nginx"
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

