output "user_data" {
  value       = "${data.template_file.default.rendered}"
  description = "User data scripts content"
}

output "policy_arn" {
  value       = "${aws_iam_policy.default.arn}"
  description = "IAM policy ARNы"
}
