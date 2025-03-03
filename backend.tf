resource "aws_instance" "backend" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private_subnet1.id
  vpc_security_group_ids = [aws_security_group.backend_sg.id]
  key_name      = var.access_key

  tags = {
    Name = "backend-server"
  }
}

output "backend_ip" {
  value = aws_instance.backend[*].private_ip
}
