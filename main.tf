terraform {
  required_version = ">= 0.8, < 0.9.5"
}

resource "aws_launch_configuration" "example" {
  image_id        = "${lookup(var.aws_amis, var.aws_region)}"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.instance.id}"]
  key_name = "${var.keypair_name}"
  
  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_elb" "example" {
  name    = "tf-elb-example"
#  availability_zones = ["${data.aws_availability_zones.all.names}"]
  security_groups    = ["${aws_security_group.elb.id}"]
  subnets = ["${aws_subnet.new_psna.id}", "${aws_subnet.new_psnb.id}", "${aws_subnet.new_psnc.id}"]

  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = "${var.server_port}"
    instance_protocol = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
    target              = "HTTP:${var.server_port}/"
  }
  
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
}
