resource "aws_db_subnet_group" "rede-publica" {
  name       = "group-subenets-publicas"
  subnet_ids = ["subnet-0f745956a1f983b6d", "subnet-0bc5b0259108ac060", "subnet-01d5026127da52ff6"]

  tags = {
    Name        = "REDE-SUBNETS"
    Environment = "Bootcamp-Campinho"
    INFRA       = "SUBENTS_GROUP_ABC"
    Managed     = "IAC"
  }
}