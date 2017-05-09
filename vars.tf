
variable "access_key"  { 
description = "AWS Access key"
default = "" }

variable "secret_key" { 
description = "AWS Secret key"
default = "" }

variable "aws_region" { 
 description = "Aws Region to host your infrastructure"
 default = "us-east-1"
}

variable "vpc_cidr" {
   default = "10.125.0.0/16"
   description = "CIDR block for VPC"
}


variable "vpc_private_subneta" {
 default = "10.125.0.0/26"
 description = "Subnet in which we can public facing instances"
}

variable "vpc_private_subnetb" {
 default =  "10.125.0.64/26"
 description = "Subnet in which we can public facing instances"
}

variable "vpc_private_subnetc" {
 default =  "10.125.0.128/26"
 description = "Subnet in which we can public facing instances"
}

variable "aws_amis" { 
 default = {
  us-east-1 = "ami-8898f39e"
  us-east-2 = "ami-5beccb3e"
 } 
}

variable "server_port" { 
  default     = 8484
  description = "The port the server will use for HTTP requests"
}

variable "keypair_name" {
  description = "Desired name of AWS key pair to use"
  default = "all_instances_keypair1"
}

