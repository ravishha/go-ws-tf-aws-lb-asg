# Web Server serving Sample Go Application - TF-Example

This folder contains example templates that deploy a cluster of web servers 
(using [EC2](https://aws.amazon.com/ec2/) and [Auto Scaling](https://aws.amazon.com/autoscaling/)) 
and a load balancer (using [ELB](https://aws.amazon.com/elasticloadbalancing/)) in an [Amazon 
Web Services (AWS) account](http://aws.amazon.com/).

The load balancer listens on port 80 and returns the text served by the Sample Go program hello.go 
from each of the web server. 


## Pre-requisites

* You must have [Terraform](https://www.terraform.io/) installed on your computer. 
* You must have an [Amazon Web Services (AWS) account](http://aws.amazon.com/).
* This could only deploy the AMIs available from us-east-1 and us-east-2 regions.
* Please use the names of the keypairs to use in each of these 2 regions (update keypair_name field in the file vars.tf).


##Below are the list of variables in the "terraform.tfvars file" that could be modified as required according to the individual environments
aws_region = "us-east-1"

keypair_name = "all_instances_keypair1"

vpc_cidrs = "10.125.0.0/16"

vpc_private_subneta = "10.125.0.0/26"

vpc_private_subnetb =  "10.125.0.64/26"

vpc_private_subnetc =  "10.125.0.128/26"


## Below are the list of resources this module creates.
* A new VPC in us-east-1 or us-east-2 regions (choice is made in the terraform.tfvars file).
* Could use terraform.tfvars file for changing the vpc and subnet cidrs as required per the environment.
* Three subnets in the new VPC in 3 different availability zones of the same region.
* A new Internet Gateway attached to the new VPC created.
* 2 Security Groups one for elastic loadbalancer deployment and one for launch configuration deployment.
* 3 Environments are created (dev, uat, prod) to deploy these codes independantly for teardown and rebuild separately.
* A new Launch Configuration for new webservers.
* A new Auto Scaling Configuration for scale up and down of the servers.
* A Elastic Load Balancer with healthcheck and listener @80
* The load balancer is configured with the capability of deploying the servers in different Availability Zones


## Quick start

**Please note that this example will deploy real resources into your AWS account.  Care has been 
taken to ensure all the resources qualify for the [AWS Free Tier](https://aws.amazon.com/free/), 
but not responsible for any charges you may incur.** 

Configure your [AWS access keys]
(http://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys) 
as environment variables:

```
export AWS_ACCESS_KEY_ID=(your access key id)
export AWS_SECRET_ACCESS_KEY=(your secret access key)
```

The below command variables the templates:

```
terraform plan
```

The following commad deploys the code:

```
terraform apply
```

When the `apply` command completes, it will output the DNS name of the load balancer.  Use the below command to test the load balancer:

```
curl http://(elb_dns_name):8080/
```

Clean up when you're require:

```
terraform destroy
```

