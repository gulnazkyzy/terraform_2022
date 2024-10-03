resource "aws_key_pair" "bastion-host" {
  key_name = "bastion-host-key"
  public_key = file("~/.ssh/id_rsa.pub")
}


resource "aws_instance" "web" {
  ami           = "ami-0b0dcb5067f052a63"
  instance_type = "t3.micro"
  associate_public_ip_address = true
  availability_zone = "us-east-1a"
  key_name = aws_key_pair.bastion-host.key_name
  monitoring = true
  tags = {
    Name = "Test"
  }
}