resource "aws_key_pair" "bastion-host" {
  key_name = "bastion-host-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_security_group" "allow_tls" {
  name        = "terraform-testing"
  description = "Allow TLS inbound traffic and all outbound traffic"
  
  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port     = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}


resource "aws_instance" "web" {
  ami           = "ami-0b0dcb5067f052a63"
  instance_type = "t3.micro"
  associate_public_ip_address = true
  availability_zone = "us-east-1a"
  key_name = aws_key_pair.bastion-host.key_name
  monitoring = true
  vpc_security_group_ids = [
    aws_security_group.allow_tls.id
  ]
  tags = {
    Name = "Test"
  }
}