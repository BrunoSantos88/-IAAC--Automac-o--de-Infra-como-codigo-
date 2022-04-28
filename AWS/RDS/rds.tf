resource "aws_db_instance" "jankins-bda" {
  identifier           = "jenkis-datada"
  allocated_storage    = 20
  availability_zone    = "us-east-1a"
  engine               = "mysql"
  engine_version       = "8.0.27"
  instance_class       = "db.t2.micro"
  db_subnet_group_name = "${"subnet-070a5c40c7e842884"}"
  vpc_security_group_ids = ["sg-05d91564d2e2ab110"]
  name                 = "jenkins_dabase"
  username             = "jenkins"
  password             = "jenkinsjenkins"
  skip_final_snapshot  = true
  storage_type         = "gp2"
  port                 = "3306"
  final_snapshot_identifier = "Ignore"
}