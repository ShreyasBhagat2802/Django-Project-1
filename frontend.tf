
resource "aws_instance" "frontend" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet1.id
  vpc_security_group_ids = [aws_security_group.frontend_sg.id]
  key_name      = var.access_key

  tags = {
    Name = "frontend-server"
  }
}

output "frontend_ip" {
  value = aws_instance.frontend[*].public_ip
}
