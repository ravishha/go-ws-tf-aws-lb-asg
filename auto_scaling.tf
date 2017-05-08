#data "aws_availability_zones" "available" {}

resource "aws_autoscaling_group" "example" {
  launch_configuration = "${aws_launch_configuration.example.id}"
  load_balancers    = ["${aws_elb.example.name}"]
  health_check_type = "ELB"
  vpc_zone_identifier = ["${aws_subnet.new_psna.id}", "${aws_subnet.new_psnb.id}", "${aws_subnet.new_psnc.id}"]
  name = "webservers"
  
  min_size = 2
  max_size = 10
  desired_capacity = "2"
  force_delete = "true"

  tag {
    key                 = "Name"
    value               = "terraform-asg-example"
    propagate_at_launch = true
  }
  
  lifecycle {
    create_before_destroy = true
  }
}

