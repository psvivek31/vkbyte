
resource "aws_internet_gateway" "my_igw1" {
  vpc_id = aws_vpc.my_vpc1.id
  tags = {
    Name = "my-igw1"
  }
}
resource "aws_route_table" "my_public_crt" {
  vpc_id = aws_vpc.my_vpc1.id

  route {
    //associated subnet can reach everywhere
    cidr_block = "0.0.0.0/0"
    //CRT uses this IGW to reach internet
    gateway_id = aws_internet_gateway.my_igw1.id
  }

  tags = {
    Name = "my-public-crt"
  }
}

resource "aws_route_table_association" "my_subnet_public1" {
  subnet_id      = aws_subnet.my_subnet_public1.id
  route_table_id = aws_route_table.my_public_crt.id
}
resource "aws_security_group" "ssh_allowed" {
  vpc_id = aws_vpc.my_vpc1.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port   = 22
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
    Name = "ssh_allowed"
  }
}