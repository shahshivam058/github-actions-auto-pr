provider "aws" {
  region = "us-east-1" # Hardcoded region
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" # Hardcoded AMI
  instance_type = "t2.micro"
  tags = {
    Name = "example-instance" # Missing standard tags like `Environment`, `Owner`, etc.
  }

  # Security Group Inline Rules (bad practice)
  vpc_security_group_ids = ["sg-123456"]

  # Deprecated attribute (if using older Terraform AWS provider versions)
  key_name = "my-key" # Hardcoded key name (might fail if not defined in the account)
}

resource "aws_security_group" "example" {
  name        = "example-sg"
  description = "Allow all inbound traffic (bad practice)"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Open to the world (insecure)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "example-security-group"
  }
}
