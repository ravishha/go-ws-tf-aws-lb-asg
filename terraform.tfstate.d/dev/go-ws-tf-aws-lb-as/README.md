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

## Below are the list of resources this module creates.
* A new VPC in us-east-1 region.
* Three subnets in the new VPC in 3 different availability zones of the same region.
* A new Internet Gateway attached to the new VPC created.
* 2 Security Groups one for elastic loadbalancer deployment and one for launch configuration deployment.
* 

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

