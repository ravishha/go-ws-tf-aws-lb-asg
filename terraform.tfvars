#Your AWS account access and secret key details go in here.
access_key = ""
secret_key = ""


#You could use us-east-1 or us-east-2 as this particular AMIs are only available in these two regions now.
aws_region = "us-east-1"


#Your choice of cidrs for vpc and private subnets to use for this environment.
vpc_cidrs = "10.125.0.0/16"
vpc_private_subneta = "10.125.0.0/26"
vpc_private_subnetb =  "10.125.0.64/26"
vpc_private_subnetc =  "10.125.0.128/26"

#You existing keypair that you might want to use for accessing these servers through ssh.
keypair_name = ""
