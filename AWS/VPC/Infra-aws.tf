resource "aws_vpc" "rede-vpc" {
    cidr_block = "192.7.0.0/16"
    enable_dns_support = true             #gives you an internal domain name
    enable_dns_hostnames = true           #gives you an internal host name
    enable_classiclink =false 
    
tags = {
    Name        = "REDE-INFRA_PRODUÇAO"
    Environment = "Bootcamp-Campinho"
    INFRA          = "1918"
    Managed     = "IAC"
  }
}

resource "aws_subnet" "subnet-PRODUÇAO_A" {
    vpc_id = "${aws_vpc.rede-vpc.id}"
    cidr_block = "192.7.0.0/24"
    map_public_ip_on_launch = "true"             //it makes this a public subnet
    availability_zone = "us-east-1a"
    
    tags = {
    Name        = "REDE-INFRA_PRODUÇAO"
    Environment = "Bootcamp-Campinho"
    INFRA          = "SUBNET_ABC"
    Managed     = "IAC"
  }
}

resource "aws_subnet" "subnet-PRODUÇAO_B" {
    vpc_id = "${aws_vpc.rede-vpc.id}"
    cidr_block = "192.7.1.0/24"
    map_public_ip_on_launch = "true"             //it makes this a public subnet
    availability_zone = "us-east-1b"
    
    tags = {
    Name        = "REDE-INFRA_PRODUÇAO"
    Environment = "Bootcamp-Campinho"
    INFRA          = "SUBNET_ABC"
    Managed     = "IAC"
  }
}

resource "aws_subnet" "subnet-PRODUÇAO_C" {
    vpc_id = "${aws_vpc.rede-vpc.id}"
    cidr_block = "192.7.2.0/24"
    map_public_ip_on_launch = "true"             //it makes this a public subnet
    availability_zone = "us-east-1c"
    
    tags = {
    Name        = "REDE-INFRA_PRODUÇAO"
    Environment = "Bootcamp-Campinho"
    INFRA          = "SUBNET_ABC"
    Managed     = "IAC"
  }
}

resource "aws_internet_gateway" "PRODUÇAO_IGW" {
    vpc_id = "${aws_vpc.rede-vpc.id}"
   
   tags = {
    Name        = "REDE-INFRA_PRODUÇAO"
    Environment = "Bootcamp-Campinho"
    INFRA          = "Internet_ABC"
    Managed     = "IAC"
  }
}

resource "aws_route_table" "ROUTE_DEFAULT_ABC" {
    vpc_id = "${aws_vpc.rede-vpc.id}"
    
    route {
        //associated subnet can reach everywhere
        cidr_block = "0.0.0.0/0" 
        //CRT uses this IGW to reach internet
        gateway_id = "${aws_internet_gateway.PRODUÇAO_IGW.id}" 
    }
    
    tags = {
    Name        = "REDE-INFRA_PRODUÇAO"
    Environment = "Bootcamp-Campinho"
    INFRA          = "ROUTE_DEFAULT_ABC"
    Managed     = "IAC"
  }
}

##########################################################################
### ASSOCIAR ROTA DEFUALT SUBNETS

resource "aws_route_table_association" "ASSOCIATE_ROUTE_C"{
    subnet_id = "${aws_subnet.subnet-PRODUÇAO_C.id}"
    route_table_id = "${aws_route_table.ROUTE_DEFAULT_ABC.id}"
}

resource "aws_route_table_association" "ASSOCIATE_ROUTE_B"{
    subnet_id = "${aws_subnet.subnet-PRODUÇAO_B.id}"
    route_table_id = "${aws_route_table.ROUTE_DEFAULT_ABC.id}"
}

resource "aws_route_table_association" "ASSOCIATE_ROUTE_A"{
    subnet_id = "${aws_subnet.subnet-PRODUÇAO_A.id}"
    route_table_id = "${aws_route_table.ROUTE_DEFAULT_ABC.id}"
}
