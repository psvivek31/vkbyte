
resource "aws_internet_gateway" "my_igw3" {
  vpc_id = aws_vpc.my_vpc3.id
  tags = {
    Name = "my-igw3"
  }
}
/* Elastic IP for NAT */

/* NAT */

resource "aws_route_table" "my_public_crt3" {
  vpc_id = aws_vpc.my_vpc3.id

  route {
    //associated subnet can reach everywhere
    cidr_block = "0.0.0.0/0"
    //CRT uses this IGW to reach internet
    gateway_id = aws_internet_gateway.my_igw3.id
  }

  tags = {
    Name = "my-public-crt3"
  }
}

#privat routetable
resource "aws_route_table" "my_private_crt3" {
  vpc_id = aws_vpc.my_vpc3.id

  route {
    //associated subnet can reach everywhere

    cidr_block = "0.0.0.0/0"
    //CRT uses this IGW to reach internet
    gateway_id = aws_internet_gateway.my_igw3.id
  }

  tags = {
    Name = "my-private-crt3"
  }
}

resource "aws_route_table_association" "my_subnet_public3" {
  subnet_id      = aws_subnet.my_subnet_public3.id
  route_table_id = aws_route_table.my_public_crt3.id
}
resource "aws_route_table_association" "my_subnet_private3" {
  subnet_id      = aws_subnet.my_subnet_private3.id
  route_table_id = aws_route_table.my_private_crt3.id
}
resource "aws_security_group" "rdp_allowed3" {
  vpc_id = aws_vpc.my_vpc3.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 3389
    to_port   = 3389
    protocol  = "tcp"
    // This means, all ip address are allowed to ssh ! 
    // Do not do it in the production. 
    // Put your office or home address in it!
    cidr_blocks = ["0.0.0.0/0"]
  }
  //If you do not add this rule, you can not reach the NGIX  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "rdp_allowed3"
  }
}