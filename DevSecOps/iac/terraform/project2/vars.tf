variable "aws_region" {
  default = "us-east-2"
}
variable "key_name" {
  description = " SSH keys to connect to ec2 instance"
  default     = "mylinkey"
}

variable "instance_type" {
  description = "instance type for ec2"
  default     = "t2.micro"
}
variable "AMI" {
  default = "ami-0fb653ca2d3203ac1"
}