resource "aws_key_pair" "bastion-host" {
  key_name = "bastion-host-key"
  public_key = file("~/.ssh/id_rsa.pub")
}