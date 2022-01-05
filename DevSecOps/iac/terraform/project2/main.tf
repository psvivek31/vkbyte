resource "aws_instance" "web1" {
  ami           = var.AMI
  instance_type = var.instance_type
  # VPC
  subnet_id = aws_subnet.my_subnet_public1.id
  # Security Group
  vpc_security_group_ids = ["${aws_security_group.ssh_allowed.id}"]
  # the Public SSH key
  key_name = var.key_name
  # nginx installation
  

}
