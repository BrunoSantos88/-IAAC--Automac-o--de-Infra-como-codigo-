resource "aws_instance" "https-server" {
  count                       = 3
  ami                         = "ami-0c02fb55956c7d316"
  instance_type               = "t2.micro"
  availability_zone           = "us-east-1a"
  subnet_id                   = "subnet-039c39be897af8799"
  associate_public_ip_address = true
  key_name                    = "aws-bootcamp"


  vpc_security_group_ids = [
    "sg-0283d75ef1e897c87"
  ]
  root_block_device {
    delete_on_termination = true
    volume_size           = 8
    volume_type           = "gp2"

    tags = {
      Name = "VOLUME-HTTPS"
    }
  }

  tags = {
    Name        = "AMAZON-EC2"
    Environment = "Treinamento"
    OS          = "amazon/amzn2-ami-kernel-5.10"
    Managed     = "IAC"
  }

  user_data = filebase64("apache.sh")
}