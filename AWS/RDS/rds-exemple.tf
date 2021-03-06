resource "aws_db_instance" "rds-bootcamp" {
  identifier                = "rds-datada"
  allocated_storage         = 20
  availability_zone         = "us-east-1a"
  engine                    = "mysql"
  engine_version            = "8.0.27"
  instance_class            = "db.t2.micro"
  db_subnet_group_name      = aws_db_subnet_group.rede-publica.id
  vpc_security_group_ids    = ["sg-02b5046dfeb87d66b"]
  name                      = "bootcamp_dabase"
  username                  = "teste"
  password                  = "testeteste"
  skip_final_snapshot       = true
  storage_type              = "gp2"
  port                      = "3306"
  final_snapshot_identifier = "Ignore"
}