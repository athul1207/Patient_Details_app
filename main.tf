provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "allow_all_traffic" {
  name        = "AllowAllTraffic"
  description = "Security group that allows all inbound and outbound traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "AllowAllTrafficSG"
  }
}

resource "aws_instance" "Python_Instance" {
  ami           = "ami-00bb6a80f01f03502" 
  instance_type = "t2.micro"

  security_groups = [
    aws_security_group.allow_all_traffic.name,
  ]

  key_name = "comp"

  tags = {
    Name = "Python_Instance"
  }
}

resource "aws_eip" "my_eip" {
  instance = aws_instance.Python_Instance.id

    tags = {
    Name = "MyElasticIP"
  }
}

output "elastic_ip" {
  value = aws_eip.my_eip.public_ip
}
