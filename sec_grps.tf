#A Security Group for the ELB so it is accessible via the web

resource "aws_security_group" "elb" {
  name = "tf-example-elb"
  description = "Used in the terraform"
  vpc_id      = "${aws_vpc.new_vpc.id}"

#HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

#Outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#Default security group to acess the instances over SSH and HTTP
resource "aws_security_group" "instance" {
  name = "tf-example-instance"
  description = "Used in the terraform"
  vpc_id = "${aws_vpc.new_vpc.id}"

  
  #HTTP access from the VPC
  ingress {
    from_port   = "${var.server_port}"
    to_port     = "${var.server_port}"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  #SSH access from the internet
  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #Outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  lifecycle {
    create_before_destroy = true
  }
}
