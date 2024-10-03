resource "aws_instance" "web" {
  ami           = "ami-0b0dcb5067f052a63"
  instance_type = "t3.micro"
}