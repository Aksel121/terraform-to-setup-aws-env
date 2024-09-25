resource "aws_instance" "web" {
  ami                         = "ami-047d7c33f6e7b4bc4"
  instance_type               = "t2.micro"
  key_name                    = "deployer-key"
  subnet_id                   = aws_subnet.public[count.index % 2].id  # Use modulo to cycle through the subnets
  vpc_security_group_ids      = [aws_security_group.allow_tls.id]
  associate_public_ip_address = true
  count                       = 6

  tags = {
    Name = "WebServer-${count.index}"
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("~/.ssh/id_ed25519.pub")
}



