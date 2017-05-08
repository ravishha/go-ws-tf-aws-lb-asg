#Declare the region

provider "aws" {
  region = "${var.aws_region}"
}

# Create a VPC to launch our instances into
resource "aws_vpc" "new_vpc" {
   tags = {
      Name = "new_vpc"
   }
   cidr_block = "${var.vpc_cidr}"
   enable_dns_hostnames = "true"
}


# Create internet access for the subnet to outside world
resource "aws_internet_gateway" "new_gateway" {
    vpc_id = "${aws_vpc.new_vpc.id}"
    tags = {
        Name = "new-gateway"
    }
}

# Grant the VPC internet access on its main route table
resource "aws_route" "internet_access" {
  route_table_id         = "${aws_vpc.new_vpc.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.new_gateway.id}"
}

# Create a subnet to launch our instances into

data "aws_availability_zones" "available" {}

resource "aws_subnet" "new_psna" {
   vpc_id = "${aws_vpc.new_vpc.id}"
   availability_zone = "${data.aws_availability_zones.available.names[0]}"
   cidr_block = "${var.vpc_private_subneta}"
   map_public_ip_on_launch = "true"
   depends_on = ["aws_internet_gateway.new_gateway"]
   tags = {
       Name = "Private Subnet"
   }
}

resource "aws_subnet" "new_psnb" {
   vpc_id = "${aws_vpc.new_vpc.id}"
   availability_zone = "${data.aws_availability_zones.available.names[1]}"
   cidr_block = "${var.vpc_private_subnetb}"
   map_public_ip_on_launch = "true"
   depends_on = ["aws_internet_gateway.new_gateway"]
   tags = {
       Name = "Private Subnet"
   }
}

resource "aws_subnet" "new_psnc" {
   vpc_id = "${aws_vpc.new_vpc.id}"
   availability_zone = "${data.aws_availability_zones.available.names[2]}"
   cidr_block = "${var.vpc_private_subnetc}"
   map_public_ip_on_launch = "true"
   depends_on = ["aws_internet_gateway.new_gateway"]
   tags = {
       Name = "Private Subnet"
   }
}
