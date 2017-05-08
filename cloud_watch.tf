
variable "rule_name" {
  description = "The name of the CloudWatch Event Rule"
  default     = "tf-example-cloudwatch-event-rule-for-sns"
}

variable "target_name" {
  description = "The name of the CloudWatch Event Target"
  default     = "tf-example-cloudwatch-event-target-for-sns"
}

variable "sns_topic_name" {
  description = "The name of the SNS Topic to send events to"
  default     = "tf-example-sns-topic"
}



resource "aws_cloudwatch_event_rule" "cw_rule" {
  name = "${var.rule_name}"

  event_pattern = <<PATTERN
{
  "detail-type": [
    "AWS API Call via CloudTrail"
  ],
  "detail": {
    "eventSource": [
      "cloudtrail.amazonaws.com"
    ]
  }
}
PATTERN
}

resource "aws_cloudwatch_event_target" "target_event" {
  rule      = "${aws_cloudwatch_event_rule.cw_rule.name}"
  target_id = "${var.target_name}"
  arn       = "${aws_sns_topic.topic-example.arn}"
}

resource "aws_sns_topic" "topic-example" {
  name = "${var.sns_topic_name}"
}


output "rule_arn" {
  value = "${aws_cloudwatch_event_rule.cw_rule.arn}"
}

output "sns_topic_arn" {
  value = "${aws_sns_topic.topic-example.arn}"
}