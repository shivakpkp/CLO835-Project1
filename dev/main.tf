data "aws_ami" "latest_amazon_linux" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_key_pair" "vm_key" {
  key_name   = var.vmprefix
  public_key = file("${var.vmprefix}.pub")
}


resource "aws_instance" "vm1" {

  ami                    = data.aws_ami.latest_amazon_linux.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.aws_subnet_block.id
  vpc_security_group_ids = [aws_security_group.vm_security_group.id]
  key_name               = aws_key_pair.vm_key.key_name
  availability_zone      = "us-east-1b"
  tags = {
    Name = "webapp-server"
  }
}
