output "ami" {
  value = aws_instance.web.ami
}

output "arn" {
  value = aws_instance.web.arn
}

output "id" {
  value = aws_instance.web.id
}

output "public_ip" {
  value = aws_instance.web.public_ip
}

output "instance_state" {
  value = aws_instance.web.instance_state
}

output "public_dns" {
  value = aws_instance.web.public_dns
}
