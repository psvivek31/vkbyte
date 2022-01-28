resource "aws_instance" "web5" {
  ami           = "ami-0ee498eea5a3c3f90"
  instance_type = var.instance_type
  # VPC
  subnet_id = aws_subnet.my_subnet_public3.id
  # Security Group
  vpc_security_group_ids = ["${aws_security_group.rdp_allowed3.id}"]

  key_name = var.key_name
  tags = {
    name = "machine5"
  }
  

}
resource "aws_instance" "web6" {
  ami           = "ami-0ee498eea5a3c3f90"
  instance_type = var.instance_type
  # VPC
  subnet_id = aws_subnet.my_subnet_private3.id
  # Security Group
  vpc_security_group_ids = ["${aws_security_group.rdp_allowed3.id}"]
  # the Public SSH key
  key_name = var.key_name
  tags = {

    name = "machine6"
  }
  

}