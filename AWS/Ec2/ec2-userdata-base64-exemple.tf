resource "aws_instance" "https-server" {
  count                       = 1
  ami                         = "ami-04505e74c0741db8d"
  instance_type               = "t2.micro"
  availability_zone           = "us-east-1a"
  subnet_id                   = "subnet-0bc5b0259108ac060"
  associate_public_ip_address = true
  key_name                    = "deployer-key"


  vpc_security_group_ids = [
    "sg-02b5046dfeb87d66b"
  ]

  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp2"


    tags = {
      Name = "VOLUME-HTTPS"
    }
  }

  tags = {
    Name        = "AMAZON-EC2"
    Environment = "Treinamento"
    OS          = "UBUNTU_20:04"
    Managed     = "IAC"
  }

  user_data = filebase64("app.sh")
}