### INSTANCIA EC2
resource "aws_instance" "Bootcamp-Campinho" {
  ami                         = "ami-0c02fb55956c7d316" ### OS
  instance_type               = "t2.micro"              ### MODELO COMPUTE 
  availability_zone           = "us-east-1a"            ### REGIAO.
  disable_api_termination     = true
  subnet_id                   = "subnet-0bc5b0259108ac060"    ### REDE
  associate_public_ip_address = true                          ### IP ADREESS
  public_key                  = "~/home/casa/windows.ssh.pem" ## CHAVE SSH


  #### SCRIPT APACHE
  user_data = file("apache.sh")


  #### Security Gruup 
  vpc_security_group_ids = [
    "sg-02b5046dfeb87d66b"
  ]
  ### VOLUME HD DA INSTANCIA

  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp2"

    ##### NOME DA MAQUINA
  }
  tags = {
    Name        = "bootcamp-campinho"
    Environment = "Bootcamp-Campinho"
    OS          = "AMAZON OS "
    Managed     = "IAC"
  }
}