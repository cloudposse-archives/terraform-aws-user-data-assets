output "user_data" {
  value = "${data.template_file.default.rendered}"
  description = "description here"
}

output "policy_arn" {
  value = "${aws_iam_policy.default.arn}"
  description = "description here"
}
