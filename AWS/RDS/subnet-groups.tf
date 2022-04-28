resource "aws_db_subnet_group" "rds-infra" {
  name        = "subnet-group"
  subnet_ids  = ["subnet-0914bc3df44b7cffe", "subnet-039c39be897af8799", "subnet-074f1dbb0a67d3bfb"]
  description = "Terraform example RDS subnet group"

  tags = {
    Name        = "Grupo-Subnet-PUBLICA"
    Environment = "Bootcamp-Campinho"
    INFRA       = "GRUPO_SUBNET_DB"
    Managed     = "IAC"
  }
}
